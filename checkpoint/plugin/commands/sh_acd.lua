
local cwOption = Clockwork.option;

local COMMAND = Clockwork.command:New("ACD");
COMMAND.tip = "Accept your death and respawn.";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (!player:Alive()) then
		player:Spawn();
	else
		player:CPNotify("You are still alive!", cwOption:GetKey("cannot_do_icon"));
	end;	
end;

COMMAND:Register();