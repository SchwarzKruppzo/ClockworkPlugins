local Clockwork = Clockwork;
local PLUGIN = PLUGIN;

-- Called when OpenAura has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
    self:LoadFields();
end;

-- Called when data should be saved.
function PLUGIN:PostSaveData()
	self:SaveFields();
end;

hook.Add("KeyPress", "forcefield_KeyPress", function(player, key)
	local data = {};
	data.start = player:GetShootPos();
	data.endpos = data.start + player:GetAimVector() * 84;
	data.filter = player;
	local trace = util.TraceLine(data);
	local entity = trace.Entity;

	if (key == IN_USE and IsValid(entity) and entity:GetClass() == "cw_forcefield") then
		entity:Use(player, player, USE_ON, 1);
	end;
end);