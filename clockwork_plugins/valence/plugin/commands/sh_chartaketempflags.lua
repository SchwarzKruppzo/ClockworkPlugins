local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("CharTakeTempFlags");
COMMAND.tip = "Take temp flags from a character.";
COMMAND.text = "<string Name> <string Flags>";
COMMAND.access = "s";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local flags = arguments[2];
	
	if(!flags or flags == "") then
		Clockwork.player:Notify(player, "You need to specify what flags to take!");
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
			player:Notify("You must be a privileged admin to be able to take 'o', 'a', or 's' flags!");
			return;
		end;
	end;

	if(target) then
		target:TakeTempFlags(flags, player);
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		return;
	end;
end;

COMMAND:Register();