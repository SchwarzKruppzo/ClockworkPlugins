--[[
	Observer stay plugin by Silverdisc - 2013
	Original Clockwork by kurozael. About the original Clockwork code:
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local COMMAND = Clockwork.command:New("Observerstay");
COMMAND.tip = "Stay where you are when exiting observer mode.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";

function COMMAND:OnRun(player, arguments)
	if (player:Alive() and !player:IsRagdolled() and !player.cwObserverReset) then
		if (player:GetMoveType(player) == MOVETYPE_NOCLIP) then
			cwObserverStay:MakePlayerExitObserverMode(player);
		end;
	end;
end;

COMMAND:Register();