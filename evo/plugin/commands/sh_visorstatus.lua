--[[ 
		Created by Polis, July 2014.
		Do not re-distribute as your own.
]]

local COMMAND = Clockwork.command:New("VisorStatus");
COMMAND.tip = "Send an update of the sociostability status via the visor.";
COMMAND.text = "<string green/yellow/red>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER);
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		if (Schema:IsPlayerCombineRank( player, {"SCN", "DvL", "SeC", "CmD"} ) or player:GetFaction() == FACTION_OTA or player:GetFaction() == FACTION_ADMIN or player:IsAdmin()) then
			local text = table.concat(arguments, " ");
			
			if (text == "green") then
				Schema:AddCombineDisplayLine( "!ATT: Sociostability status modification. CODE: GREEN.", Color(10, 255, 0, 255) );
				BroadcastLua("LocalPlayer():ConCommand('virgil1')")

			elseif (text == "yellow") then
				Schema:AddCombineDisplayLine( "!ATT: Sociostability status modification. CODE: YELLOW.", Color(255, 255, 10, 255) );
				BroadcastLua("LocalPlayer():ConCommand('virgil1')")

			elseif (text == "red") then
				Schema:AddCombineDisplayLine( "!ATT: Sociostability status modification. CODE: RED.", Color(255, 10, 0, 255) );
				BroadcastLua("LocalPlayer():ConCommand('virgil2')")
				
			else
				Clockwork.player:Notify(player, "That is not a valid status string!");
				
			end;
			
		else
			Clockwork.player:Notify(player, "You are not ranked high enough to use this command!");
		end;
	else
		Clockwork.player:Notify(player, "You are not the Combine!");
	end;
end;



COMMAND:Register();