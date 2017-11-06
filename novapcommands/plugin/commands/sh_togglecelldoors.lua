--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local COMMAND = Clockwork.command:New("ToggleRedCellDoors");
COMMAND.tip = "Open/Close all Red Cell Doors";
COMMAND.text = "<none>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER);

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Clockwork.player:HasFlags(player, "K")) then
		for k,v in pairs(ents.FindByName("toggle_cell_door")) do
			v:Fire("Press", "", 0);
		end
		Clockwork.kernel:PrintLog(LOGTYPE_MAJOR, player:Name().." ("..player:SteamID()..") has toggled the red cell doors.");
	else
		Clockwork.player:Notify(player, "I'm sorry, it seems like you cannot be trusted with this command!");
	end;
end;

COMMAND:Register();