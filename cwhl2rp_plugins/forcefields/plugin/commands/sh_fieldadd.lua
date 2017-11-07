local COMMAND = Clockwork.command:New("FieldAdd");

local PLUGIN = PLUGIN;

COMMAND.tip = "Add a Combine force field at your position.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	if (!trace.Hit) then return end

	local shouldDissolve = Clockwork.kernel:ToBool(arguments[1]);

	local k = ents.Create("cw_forcefield");
	local entity = k:SpawnFunction(player, trace)
	k:Remove()
	
	if (IsValid(entity)) then
		entity.shouldDissolve = shouldDissolve;
		Clockwork.player:Notify(player, "You have added a force field.");
		PLUGIN:SaveFields()
	end;
end;

COMMAND:Register()