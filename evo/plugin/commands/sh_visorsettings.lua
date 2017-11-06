--[[ 
		Created by Polis, July 2014.
		Do not re-distribute as your own.
]]

local COMMAND = Clockwork.command:New("VisorSettings");
COMMAND.tip = "Open the visor settings menu to configure your EVO experience.";
COMMAND.text = "<none>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER);

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
			player:ConCommand("evo_settings")
	else
		Clockwork.player:Notify(player, "You are not the Combine!");
	end;
end;



COMMAND:Register();