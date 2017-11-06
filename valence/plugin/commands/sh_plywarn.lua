local PlUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("PlyWarn");
COMMAND.tip = "Warn a player.";
COMMAND.text = "<string Name> <string Reason>";
COMMAND.access = "o";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local reason = table.concat(arguments, " ", 2);
	
	if (!reason or reason == "") then
		reason = "an unspecified reason.";
	end;
	
	if (target) then
		for k, v in pairs(_player.GetAll()) do
			if(v:IsAdmin() or v:IsUserGroup("operator")) then
				Clockwork.player:Notify(v, "[ADMIN] "..player:Name().." has warned "..target:Name().." for: "..reason);
			end;
			if(v:Name() == target:Name()) then
				Clockwork.player:Notify(v, "[ADMIN] "..player:Name().." has warned you for: "..reason)
				Clockwork.hint:Send(v, "[ADMIN] "..player:Name().." has warned you for: "..reason, 10, Color(255, 0, 0, 255))
			end;
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();