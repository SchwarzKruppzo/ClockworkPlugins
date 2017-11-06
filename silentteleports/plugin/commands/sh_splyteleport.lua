local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("SPlyTeleport");
COMMAND.tip = "Silently teleport a player to your target location.";
COMMAND.text = "<string Name>";
COMMAND.access = "o";
COMMAND.arguments = 1;

function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if (target) then
		Clockwork.player:SetSafePosition(target, player:GetEyeTraceNoCursor().HitPos);
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();