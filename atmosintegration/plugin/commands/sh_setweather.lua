local COMMAND = Clockwork.command:New("SetWeather");
COMMAND.tip = "Set the current Atmos weather.";
COMMAND.text = "<string clear|storm|snow>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local atmos = AtmosGlobal;

	if (!atmos) then
		Clockwork.player:Notify(player, "Atmos is not on the server!");
		return;
	end;

	if (arguments[1] == "snow") then
		if (atmos:GetSnowing()) then
			Clockwork.player:Notify(player, "It's already snowing!");
		else
			if (atmos:GetStorming()) then
				atmos:StopStorm();
			end;

			atmos:StartSnow();
			Clockwork.player:Notify(player, "You have set the weather to snow.");
		end;
	elseif (arguments[1] == "storm") then
		if (atmos:GetStorming()) then
			Clockwork.player:Notify(player, "It's already storming!");
		else
			if (atmos:GetSnowing()) then
				atmos:StopSnow();
			end;
			
			atmos:StartStorm();
			Clockwork.player:Notify(player, "You have set the weather to storm.");
		end;
	else
		if (atmos:GetStorming() or atmos:GetSnowing()) then
			if (atmos:GetStorming()) then
				atmos:StopStorm();
			end;

			if (atmos:GetSnowing()) then
				atmos:StopSnow();
			end;

			Clockwork.player:Notify(player, "You have set the weather to clear.");
		else
			Clockwork.player:Notify(player, "It's already clear!");
		end;
	end;
end;

COMMAND:Register();