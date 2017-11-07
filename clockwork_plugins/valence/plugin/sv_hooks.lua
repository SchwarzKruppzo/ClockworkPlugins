local PLUGIN = PLUGIN;
local VERSION = "1.5.1";

-- Called to check if a player does have a flag.
function PLUGIN:PlayerDoesHaveFlag(player, flag)
	return self:HasTempFlag(player, flag);
end;

function PLUGIN:PlayerThink(player, curTime, infoTable)
	local playerFlags = player:GetCharacterData("tempFlags") or {};
	local expiredFlags = nil;
	player:SetSharedVar("tempFlags", util.TableToJSON(playerFlags));
	
	for k, v in pairs (playerFlags) do
		if tonumber(v) then
			if v < os.time() then
				expiredFlags = (expiredFlags or "")..k;
			end;
		end;
	end;

	if (expiredFlags) then
		player:Notify("The following flags: '"..expiredFlags.."' have expired.")
		Clockwork.hint:Send(player, "The following flags: '"..expiredFlags.."' have expired.", 4, Color(255, 0, 0, 255))
		player:TakeTempFlags(expiredFlags, nil, true);
	end;
end;

function PLUGIN:Initialize()
	print("[Valence "..VERSION.."]")
	if (Clockwork.config:Get("ooc_enable"):Get()) then
		Clockwork.config:Get("enable_ooc"):Set(true)
	end
	
	PLUGIN.privileges:Add(Clockwork.config:Get("owner_steamid"):Get());
end


function PLUGIN:PlayerCanSayLOOC(player, text)
	if (player.muted) then
		player:Notify("You are muted!");
		return false;
	end

	if (player.oocmuted) then
		player:Notify("Your Out-of-character chat is muted!");
		return false;
	end

	if (player.loocmuted) then
		player:Notify("Your Local Out-of-character chat is muted!");
		return false;
	end

	if (player.gimped) then
		player:SendGimp("looc");
		return false;
	end
end

function PLUGIN:PlayerCanSayOOC(player, text)
	local flag = nil;
	local curTime = CurTime();
	local isGimped = player.gimped or false;

	if (Clockwork.config:Get("admin_super_ooc"):Get()) then
		flag = "a";
	end
	
	if (Clockwork.config:Get("operator_super_ooc"):Get() and Clockwork.config:Get("admin_super_ooc"):Get()) then
		flag = "o";
	end
	
	if (!player.cwNextTalkOOC) then
		player.cwNextTalkOOC = -1;
	end
	
	if (player.muted) then
		player:Notify("You are muted!");
		return false;
	end
	
	if (player.oocmuted) then
		player:Notify("Your Out-of-character chat is muted!");
		return false;
	end
	
	if (player.goocmuted) then
		player:Notify("Your Global Out-of-character chat is muted!");
		return false;
	end

	if (!Clockwork.config:Get("enable_ooc"):Get()) then
		if (flag) then
			if Clockwork.player:HasFlags(player, flag) then
				if not (curTime > player.cwNextTalkOOC) then
					if Clockwork.config:Get("staff_respect_interval"):Get() then
						player:Notify("You cannot cannot talk out-of-character for another "..math.ceil(player.cwNextTalkOOC - CurTime()).." second(s)!");
						return false;
					end
				else
					if isGimped then
						player:SendGimp("ooc");
						return false;
					else
						Clockwork.kernel:ServerLog("[OOC] "..player:Name()..": "..text);
						Clockwork.chatBox:Add(nil, player, "ooc", text);
						return false;
					end
				end;
			else
				player:Notify("Out-of-character chat is disabled!")
				return false;
			end
		else
			player:Notify("Out-of-character chat is disabled!")
			return false;
		end
	end

	if (Clockwork.config:Get("staff_respect_interval"):Get()) then
		if not (curTime > player.cwNextTalkOOC) then
			if (flag) then
				if (!Clockwork.player:HasFlags(player, flag)) then
					player:Notify("You cannot cannot talk out-of-character for another "..math.ceil(player.cwNextTalkOOC - CurTime()).." second(s)!");
					return false;
				else
					if (isGimped) then
						player:SendGimp("ooc");
						return false;
					else
						Clockwork.kernel:ServerLog("[OOC] "..player:Name()..": "..text);
						Clockwork.chatBox:Add(nil, player, "ooc", text);
						return false;
					end
				end;
			else
				player:Notify("You cannot cannot talk out-of-character for another "..math.ceil(player.cwNextTalkOOC - CurTime()).." second(s)!");
				return false;
			end
		else
			if (isGimped) then
				player:SendGimp("ooc");
				Clockwork.kernel:ServerLog("[OOC] "..player:Name()..": "..text);
				Clockwork.chatBox:Add(nil, player, "ooc", text);
				return false;
			end
		end
	end

	if (isGimped) then
		if (!player.cwNextTalkOOC or curTime > player.cwNextTalkOOC) or !Clockwork.config:Get("staff_respect_interval"):Get() then
			player:SendGimp("ooc");
			return false;
		end
	end
end

function PLUGIN:PlayerCanSayIC(player, text)
	local curTime = CurTime();
	
	if (player.muted) then
		player:Notify("You are muted!");
		return false;
	end

	if (player.icmuted) then
		player:Notify("Your In-character chat is muted!");
		return false;
	end

	if (string.sub(text, 1, 1) == "@") then
		text = string.Trim(string.sub(text, 2))
		
		if (!PLUGIN:AnyAdminOnline()) then
			PLUGIN:SaveReportLog(player, text);
			player:Notify("No admin online! However, what you said has been logged.");
			return;
		end

		if (!Clockwork.player:IsAdmin(player)) then
			if (!player.cwNextTalkAdmin or curTime > player.cwNextTalkAdmin) then
				player.cwNextTalkAdmin = curTime + Clockwork.config:Get("admin_interval"):Get();
			else
				player:Notify("You cannot cannot submit reports for another "..math.ceil(player.cwNextTalkAdmin - CurTime()).." second(s)!");
				return false;
			end
		end

		if (text == "") then
			player:Notify("You are reporting nothing!");
			return false;
		end

		local listeners = {}
		local usergroup = string.gsub(string.upper(string.sub(player:GetUserGroup(), 1, 1))..string.sub(player:GetUserGroup(), 2), "admin", "Admin")
		
		for k, v in pairs(_player.GetAll()) do
			if (Clockwork.player:IsAdmin(v) and v != player) then
				table.insert(listeners, v)
			end;
		end;
		
		table.insert(listeners, player)

		if !Clockwork.player:IsAdmin(player) then
			PLUGIN:SaveReportLog(player, text);
			Clockwork.kernel:ServerLog("[REPORT] "..player:Name()..": "..text);
			Clockwork.chatBox:SendColored(listeners, Color(255, 0, 0), "[REPORT] ", Color(255, 125, 125), player:Name(), ": ", Color(255, 255, 255), text)
		else
			Clockwork.kernel:ServerLog("[ADMIN CHAT] "..player:Name().." - "..usergroup..": "..text);
			Clockwork.chatBox:SendColored(listeners, Color(0, 125, 255), "[ADMIN CHAT] ", Color(125, 255, 255), player:Name(), " - ", usergroup, ": ", Color(255, 255, 255), text)
		end

		return false;
	end

	if (player.gimped) then
		player:SendGimp("ic");
		return false;
	end
end

-- Called when attempts to use a command.
function PLUGIN:PlayerCanUseCommand(player, commandTable, arguments)
	local lowername = string.lower(commandTable.name);

	if (lowername == "it" or lowername == "me" or lowername == "w" or lowername == "y" or lowername == "radio") then
		if (player.muted) then
			Clockwork.player:Notify(player, "You are muted!");
			return false;
		end

		if (player.icmuted) then
			Clockwork.player:Notify(player, "Your In-character chat is muted!");
			return false;
		end

		if (player.gimped) then
			if (#PLUGIN.gimps.stored > 0) then
				local gimp = PLUGIN.gimps.stored[math.random(1, #PLUGIN.gimps.stored)]
				local gimpText = gimp.text
				local gimpDisplay = ""
				
				if gimp.bShowIsGimp then
					gimpDisplay = "GIMP: "
				end

				for i = 1, #arguments do arguments[i] = nil; end;

				arguments[1] = gimpDisplay..gimpText;
			else
				arguments[1] = "GIMP: lol how do i talk";
			end
		end
	elseif (lowername == "charfallover") then
		if (player:IsFrozen()) then
			player:Notify("You cannot do this action at the moment!");
			return false;
		end
	end;

	if (player.silenced) then 
		if (commandTable.access == "o" or commandTable.access == "a" or commandTable.access == "s") then
			player:Notify("You are silenced, and unable to run any administrative commands.")
			return false
		end
	end
end

-- Called when a player types and enters a text message.
function PLUGIN:PlayerSay(player, text, bTeam) 		
	if (string.sub(text, 1, 2) == "//") then	
		for k, v in pairs(Clockwork.censor.stored) do
			local word = string.lower(v.text)
			local replace = v.replace
			local final = text:match(self:NoCase(word))
			
			if (final) then
				text = string.gsub(text, final, replace)
			end
		end
	end
end

--[[ 
	Broadcast the master manifest.
	This took us way too much time to do.
--]]
Clockwork.datastream:Hook("ReqAllChars", function(player, data)
	local CW_MASTER_MANIFEST = {};
	for k, v in pairs(_player.GetAll()) do
		if (v:HasInitialized()) then
			for k2, v2 in pairs(v:GetCharacters()) do
				CW_MASTER_MANIFEST[#CW_MASTER_MANIFEST + 1] = {
					steamID = v:SteamID();
					godded = v.godded,
					gimped = v.gimped,
					silenced = v.silenced,
					name = v2.name,
					characterID = v2.characterID
				};
			end;
			
		end;
	end;
	
	Clockwork.datastream:Start(player, "RecAllChars", CW_MASTER_MANIFEST);
end);