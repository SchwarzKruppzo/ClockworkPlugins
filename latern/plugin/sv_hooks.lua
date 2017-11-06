local PLUGIN = PLUGIN;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	self:LoadLatern();
end;

-- Called if it gots saved.
function PLUGIN:PostSaveData()
	self:SaveLatern();
end;