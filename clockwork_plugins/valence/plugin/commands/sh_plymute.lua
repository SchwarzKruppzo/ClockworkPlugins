local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("PlyMute");
COMMAND.tip = "Mute/unmute a player's Chat. (This one always needs to be deactivated separately,\ntrying to unmute another one of player's chats, will still leave this enabled.)";
COMMAND.text = "<string Name>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	echo = Clockwork.config:Get("admin_echoes"):Get()
	if target then
		if (target.muted) then
			target.muted = false;
			if echo then
				Clockwork.player:NotifyAll(target:Name().."'s chat has been unmuted by "..player:Name()..".");
			end
		else
			target.muted = true;
			if echo then
				Clockwork.player:NotifyAll(target:Name().."'s chat has been muted by "..player:Name()..".");
			end
		end
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();