local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("PlyGod");
COMMAND.tip = "God a player.";
COMMAND.text = "<string Name>";
COMMAND.access = "a";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1])
	if target then
		local echo = Clockwork.config:Get("admin_echoes"):Get()
		if !target.godded then
			target:GodEnable()
			target.godded = true
			if echo then
				Clockwork.player:NotifyAll(player:Name().." has godded "..target:Name()..".")
			end
		else
			target:GodDisable()
			target.godded = false
			if echo then
				Clockwork.player:NotifyAll(player:Name().." has ungodded "..target:Name()..".")
			end
		end
		Clockwork.datastream:Start(target, "Toggling", "god")
	else
		player:Notify(arguments[2].." is not a valid player!")
	end
end;

COMMAND:Register();