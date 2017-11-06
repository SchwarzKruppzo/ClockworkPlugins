local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("PlySilence");
COMMAND.tip = "Prevent a player from running any administrative commands.";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(table.concat(arguments, " "))
	local echo = Clockwork.config:Get("admin_echoes"):Get()
	
	if (target) then

		if (target.silenced) then
			target.silenced = false
			target:Notify("You have been unsilenced.")
			player:Notify(target:Name().." has been unsilenced.")
			
			if (echo) then
				Clockwork.player:NotifyAll(player:Name().." has unsilenced "..target:Name()..".")
			end
		else
			target.silenced = true
			target:Notify("You have been silenced.")
			player:Notify(target:Name().." has been silenced.")

			if (echo) then
				Clockwork.player:NotifyAll(player:Name().." has silenced "..target:Name()..".")
			end
		end
	end
end;

COMMAND:Register();