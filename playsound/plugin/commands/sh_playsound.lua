--[[
This work is licensed under a Creative Commons
Attribution-ShareAlike 4.0 International License.

Created by 8bitMafia.
--]]

local COMMAND = Clockwork.command:New("PlaySound");
COMMAND.tip = "Broadcast sounds/music to all players.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	net.Start("cwOpenSoundMenu")
	net.Send(player)
end;

COMMAND:Register();