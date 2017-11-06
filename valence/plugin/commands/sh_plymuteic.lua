local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("PlyMuteIC");
COMMAND.tip = "Mute/unmute a player's IC chat.";
COMMAND.text = "<string Name>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local echo = Clockwork.config:Get("admin_echoes"):Get()
	if target then
		if (target.icmuted) then
			target.icmuted = false;
			if echo then
				Clockwork.player:NotifyAll(target:Name().."'s IC Chat has been unmuted by "..player:Name()..".");
			end
		else
			target.icmuted = true;
			if echo then
				Clockwork.player:NotifyAll(target:Name().."'s IC Chat has been muted by "..player:Name()..".");
			end
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();