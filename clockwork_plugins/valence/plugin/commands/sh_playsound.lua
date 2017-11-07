local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("PlaySound");
COMMAND.tip = "Make all players play a sound.";
COMMAND.text = "<string SoundPath>";
COMMAND.access = "a";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	BroadcastLua("surface.PlaySound('"..arguments[1].."')");
end;

COMMAND:Register();