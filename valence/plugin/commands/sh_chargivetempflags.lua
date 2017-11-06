local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("CharGiveTempFlags");
COMMAND.tip = "Temporarily give flags to a character.";
COMMAND.text = "<string Name> <string Flags> <number Minutes>";
COMMAND.access = "s";
COMMAND.arguments = 3;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1])
	local flags = arguments[2]
	local time = tonumber(arguments[3]) * 60

	if(!flags or flags == "") then
		Clockwork.player:Notify(player, "You need to specify what flags to give!")
		return;
	end;
	
	if string.find(flags, "a") or string.find(flags, "s") or string.find(flags, "o") then
		local authed = false;
		for k, v in pairs (PLUGIN.privileges.stored) do
			if v.SteamID == player:SteamID() then
				authed = true;
				break;
			end;
		end;
		if !authed then
			player:Notify("You must be a privileged admin to be able to give 'o', 'a', or 's' flags!");
			return;
		end;
	end;

	if(!time or time == "") then
		Clockwork.player:Notify(player, "You need to specify an amount of time!")
		return;
	end;

	if(target) then
		target:GiveTempFlags(flags, time, player)
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!")
		return;
	end;
end;

COMMAND:Register();