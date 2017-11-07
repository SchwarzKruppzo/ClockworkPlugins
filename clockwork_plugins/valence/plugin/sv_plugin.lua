local PLUGIN = PLUGIN;
local Clockwork = Clockwork;
local playerMeta = FindMetaTable("Player")

util.AddNetworkString("chatMessage");

Clockwork.config:Add("enable_ooc", true);
Clockwork.config:Add("admin_super_ooc", true);
Clockwork.config:Add("staff_respect_interval", true)
Clockwork.config:Add("operator_super_ooc", false)
Clockwork.config:Add("admin_interval", 20)
Clockwork.config:Add("admin_echoes", true)
Clockwork.config:Add("ooc_enable", true)

-- A function to get a player's temporary flags.
function playerMeta:GetTempFlags()
	return self:GetCharacterData("tempFlags") or false;
end;

-- A function to get a player's temp flag information.
function playerMeta:GetTempFlagsInfo()
	local playerFlags = self:GetTempFlags();
	if (!playerFlags) then return false; end;
	local flagData = {}
	
	for k, v in pairs (playerFlags) do
		if (type(v) != "number") then return; end;
		local timeLeft = v - os.time();
		local timeUnit = "minutes";
		if (timeLeft) < 60 then
			timeUnit = "seconds";
		else
			timeLeft = math.Round(((v - os.time()) / 60), 2);
		end;
		
		table.insert(flagData, "'"..k.."' Flag - Expires in "..timeLeft.." "..timeUnit..".");
	end;

	return flagData;
end;

-- A function to give a player temporary flags.
function playerMeta:GiveTempFlags(flags, duration, giver, bSilent)
	local playerFlags = self:GetCharacterData("tempFlags") or {}
	for i = 1, #flags do
		local flag = string.sub(flags, i, i);
		Clockwork.plugin:Call("PlayerFlagsGiven", self, flag);
		playerFlags[flag] = os.time() + duration;
	end;

	self:SetCharacterData("tempFlags", playerFlags);

	if (bSilent) then return; end;

	if (IsValid(giver)) then
		Clockwork.player:NotifyAll(self:Name().." was given '"..flags.."' flags for "..(duration / 60).." minutes, by "..giver:GetName()..".");
	else
		Clockwork.player:NotifyAll(self:Name().." was given '"..flags.."' flags for "..(duration / 60).." minutes, by an unknown admin.");
	end;
end;

-- A function to take a player's temporary flags.
function playerMeta:TakeTempFlags(flags, taker, bSilent)
	local playerFlags = self:GetCharacterData("tempFlags") or {}

	for i = 1, #flags do
		local flag = string.sub(flags, i, i);
		for k, v in pairs (playerFlags) do
			if k == flag then
				playerFlags[k] = nil;
			end;
			if !Clockwork.player:HasFlags(self, flag) then
				Clockwork.plugin:Call("PlayerFlagsTaken", self, flag);
			end;
		end;
	end;

	if (table.Count(playerFlags)) != 0 then
		self:SetCharacterData("tempFlags", playerFlags);
	else
		self:SetCharacterData("tempFlags", nil);
	end;

	if (bSilent) then return; end;

	if (IsValid(taker)) then
		Clockwork.player:NotifyAll(self:Name().." was taken '"..flags.."' temp flags, by "..taker:GetName()..".")
	else
		Clockwork.player:NotifyAll(self:Name().." was taken '"..flags.."' temp flags, by an unknown admin.")
	end;
end;

-- A function to get a player's usergroup. (Because IsUserGroup sux)
function playerMeta:GetUserGroup()
	return self:GetNWString("UserGroup")
end

-- A function to send a gimp message.
function playerMeta:SendGimp(chatType)
	if (#PLUGIN.gimps.stored > 0) then
		local text
		local gimp = PLUGIN.gimps.stored[math.random(1, #PLUGIN.gimps.stored)]
		local gimpText = gimp.text
		local gimpDisplay = ""
		local curTime = CurTime();

		if (gimp.bShowIsGimp) then
			gimpDisplay = "GIMP: "
		end

		text = gimpDisplay..gimpText
		
		if (chatType) == "ooc" or chatType == "looc" then
			Clockwork.kernel:ServerLog("["..string.upper(chatType).."] "..self:Name()..": "..text);
		end

		if (chatType) == "ic" then
			Clockwork.chatBox:AddInRadius(self, "ic", text, self:GetPos(), Clockwork.config:Get("talk_radius"):Get());
		elseif chatType == "looc" then
			Clockwork.chatBox:AddInRadius(self, "looc", text, self:GetPos(), Clockwork.config:Get("talk_radius"):Get());
		elseif chatType == "ooc" then
			Clockwork.chatBox:Add(nil, self, chatType, text);
		else
			Clockwork.chatBox:Add(nil, self, chatType, text);
		end

		if (chatType) == "ooc" then
			self.cwNextTalkOOC = curTime + Clockwork.config:Get("ooc_interval"):Get();
		end
	else
		text = "GIMP: lol how do i talk"
		if (chatType == "ooc" or chatType == "looc") then
			Clockwork.kernel:ServerLog("["..string.upper(chatType).."] "..self:Name()..": "..text);
		end

		if (chatType == "ic") then
			Clockwork.chatBox:AddInRadius(self, "ic", text, self:GetPos(), Clockwork.config:Get("talk_radius"):Get());
		elseif chatType == "looc" then
			Clockwork.chatBox:AddInRadius(self, "looc", text, self:GetPos(), Clockwork.config:Get("talk_radius"):Get());
		elseif chatType == "ooc" then
			Clockwork.chatBox:Add(nil, self, chatType, text);
		else
			Clockwork.chatBox:Add(nil, self, chatType, text);
		end

		if (chatType == "ooc") then
			self.cwNextTalkOOC = curTime + Clockwork.config:Get("ooc_interval"):Get();
		end
	end
end

-- A function to check whether or not there is an admin online.
function PLUGIN:AnyAdminOnline()
	for k, v in pairs (player.GetAll()) do
		if (Clockwork.player:IsAdmin(v)) then
			return true;
		end
	end
end

-- A function to save the reports.
function PLUGIN:SaveReportLog(player, text)
	if (IsValid(player) and text) then
		Clockwork.kernel:SetupFullDirectory("garrysmod/NoMoreULX Reports/"..os.date("%d %B %Y").."/"..Schema:GetName().."/"..game.GetMap())
		Clockwork.file:Write("NoMoreULX Reports/"..os.date("%d %B %Y").."/"..Schema:GetName().."/"..game.GetMap().."/"..os.date("%H%M%S")..player:GetCharacterKey()..".txt", "Date of the Report: "..os.date("%d %B %Y").."\nTime of the Report: "..os.date("%H:%M").."\n\nCharacter Name: "..player:Name().."\nCharacter Faction: "..player:GetFaction().."\n\nSteam Name: "..player:SteamName().."\nSteamID: "..player:SteamID().."\n\nWere admins online: "..tostring(PLUGIN:AnyAdminOnline()).."\n\n--Body of the Report: \n\n"..text)
	end;
end;

-- A function to match with case insensitivity.
-- http://www.lua.org/pil/20.4.html
function PLUGIN:NoCase(text)
	text = string.gsub(text, "%a", function (c)
			return string.format("[%s%s]", string.lower(c), string.upper(c)) 
	end);
	
	return text;
end;