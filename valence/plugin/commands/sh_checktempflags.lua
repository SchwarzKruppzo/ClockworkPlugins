local PlUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("CheckTempFlags");
COMMAND.tip = "Check your temp flags, or another player's.";
COMMAND.text = "[string Name]";
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if arguments[1] then
		if !Clockwork.player:IsAdmin(player) then
			player:Notify("You aren't a staff member!")
			return;
		end;
		local target = Clockwork.player:FindByID(arguments[1]);
		if (target) then
			if target:GetTempFlagsInfo() then
				for k, v in pairs (target:GetTempFlagsInfo()) do
					player:Notify(target:Name().."'s "..v);
				end;
			else
				player:Notify(target:Name().." has no temp flags.");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	else
		if player:GetTempFlagsInfo() then
			for k, v in pairs (player:GetTempFlagsInfo()) do
				player:Notify("Your "..v);
			end;
		else
			player:Notify("You have no temp flags.");
		end;
	end;
end;

COMMAND:Register();