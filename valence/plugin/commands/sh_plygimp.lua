local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("PlyGimp");
COMMAND.tip = "Gimp/Ungimp a player.";
COMMAND.text = "<string Name>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local echo = Clockwork.config:Get("admin_echoes"):Get()
	if target then
		if (target.gimped) then
			target.gimped = false;
			if echo then
				Clockwork.player:NotifyAll(target:Name().." has been ungimped by "..player:Name()..".");
			end;
		else
			target.gimped = true;
			if echo then
				Clockwork.player:NotifyAll(target:Name().." has been gimped by "..player:Name()..".");
			end
		end;
		Clockwork.datastream:Start(target, "Toggling", "gimp")
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();