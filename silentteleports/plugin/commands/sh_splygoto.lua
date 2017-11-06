local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("SPlyGoto");
COMMAND.tip = "Silently go to a player's location.";
COMMAND.text = "<string Name>";
COMMAND.access = "o";
COMMAND.arguments = 1;

function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if (target) then
		Clockwork.player:SetSafePosition(player, target:GetPos());
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();