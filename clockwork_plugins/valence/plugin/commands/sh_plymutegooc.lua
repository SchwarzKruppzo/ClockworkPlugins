local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("PlyMuteGOOC");
COMMAND.tip = "Mute/unmute a player's Global OOC.";
COMMAND.text = "<string Name>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	echo = Clockwork.config:Get("admin_echoes"):Get()
	if target then
		if (target.goocmuted) then
			target.goocmuted = false;
			if echo then
				Clockwork.player:NotifyAll(target:Name().."'s Global OOC has been unmuted by "..player:Name()..".");
			end
			if target.oocmuted then
				target.oocmuted = false;
				target.loocmuted = true;
			end
		else
			target.goocmuted = true;
			if echo then
				Clockwork.player:NotifyAll(target:Name().."'s Global OOC has been muted by "..player:Name()..".");
			end
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();