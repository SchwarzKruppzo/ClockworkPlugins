--[[ 
		Created by Polis, July 2014.
		Do not re-distribute as your own.
]]

local COMMAND = Clockwork.command:New("VisorBackup");
COMMAND.tip = "Send a request for backup via the visor.";
COMMAND.text = "<string Details>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER);
COMMAND.args = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		if (player:GetFaction() == FACTION_MPF or player:GetFaction() == FACTION_OTA) then
			local text = table.concat(arguments, " ");

			if (text == "") then
				local text = "N/A";
				
				return;
			end;
			
			Schema:AddCombineDisplayLine( "!ATT: "..player:Name()..";  ASSISTANCE REQUEST. Prompt: "..text..".", Color(255, 10, 0, 255) );
		    BroadcastLua("LocalPlayer():ConCommand('virgil1')")
	else
		Clockwork.player:Notify(player, "You are not the combine!");
	end;
end;
end;

COMMAND:Register();