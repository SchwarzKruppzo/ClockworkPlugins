--[[ 
		Created by Polis, July 2014.
		Do not re-distribute as your own.
]]

/*----------------------\
| Edited by Viomi       |
| viomi@openmailbox.org | // Removed ability for combine to use /request
\----------------------*/

local COMMAND = Clockwork.command:FindByID("request")

-- Called when the command is run by the player.
function COMMAND:OnRun(player, arguments)
	local isCityAdmin = (player:GetFaction() == FACTION_ADMIN);
	local text = table.concat(arguments, " ");
	local ciD

	if player:GetSharedVar("citizenID") == "" then 
	ciD = " N/A" 
	else 
	ciD = player:GetSharedVar("citizenID") 
	end
	
	if (text == "") then
		Clockwork.player:Notify(player, "You did not specify enough text!");
		
		return;
	end;
	
	if (player:HasItemByID("request_device") or isCityAdmin) then
		local curTime = CurTime();
		
		if (!player.nextRequestTime or isCityAdmin or curTime >= player.nextRequestTime) then
			Schema:AddCombineDisplayLine( "!REQ: Citizen: "..player:Name()..", #"..ciD..": "..text, Color(218, 165, 32, 255) );
			player:EmitSound("evo/virgil_2.wav")
			--BroadcastLua("LocalPlayer():ConCommand('virgil1')")
			Clockwork.chatBox:SendColored(player, Color(184, 134, 11, 255), "Your request was delivered.")
			
			if (!isCityAdmin) then
				player.nextRequestTime = curTime + 30;
			end;
		else
			Clockwork.player:Notify(player, "You cannot send another request for "..math.ceil(player.nextRequestTime - curTime).." more second(s)!");
		end;
	else
		Clockwork.player:Notify(player, "You do not currently own a request device!");
	end;
end;
