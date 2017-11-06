local Clockwork = Clockwork;
local cwCTO = cwCTO;

local COMMAND = Clockwork.command:New("CharSetBiosignalStatus");
COMMAND.tip = "Turn a character's biosignal on or off.";
COMMAND.text = "<string Name> <bool Enabled>";
COMMAND.access = "o";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local ply = Clockwork.player:FindByID(arguments[1]);

	if (ply) then
		local bEnable = Clockwork.kernel:ToBool(arguments[2]);
		local result = cwCTO:SetPlayerBiosignal(ply, bEnable);
	
		if (result == cwCTO.ERROR_NOT_COMBINE) then
			Clockwork.player:Notify(player, ply:Name() .. " is not the Combine!");
		elseif (result == cwCTO.ERROR_ALREADY_ENABLED) then
			Clockwork.player:Notify(player, ply:Name() .. "'s biosignal is already enabled!");
		elseif (result == cwCTO.ERROR_ALREADY_DISABLED) then
			Clockwork.player:Notify(player, ply:Name() .. "'s biosignal is already disabled!");
		else
			Clockwork.player:Notify(player, "You have " .. (bEnable and "enabled" or "disabled") .. " " .. ply:Name() .. "'s biosignal.");
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

COMMAND:Register();
