
-----------------------------------------------------
-- If a client lags out too much, clientside meshes will be removed.
-- This timer will reinstantiate the forcefield meshes every 250 seconds to ensure collisions stay consistent.
timer.Create("forcefieldUpdater", 250, 0, function()
	for k, v in pairs(ents.FindByClass("cw_forcefield")) do
		if (IsValid(v:GetDTEntity(0))) then
			local startPos = v:GetDTEntity(0):GetPos() - Vector(0, 0, 50);
			local verts = {
				{pos = Vector(0, 0, -35)},
				{pos = Vector(0, 0, 150)},
				{pos = v:WorldToLocal(startPos) + Vector(0, 0, 150)},
				{pos = v:WorldToLocal(startPos) + Vector(0, 0, 150)},
				{pos = v:WorldToLocal(startPos) - Vector(0, 0, 35)},
				{pos = Vector(0, 0, -35)},
			};

			v:PhysicsFromMesh(verts);
			v:EnableCustomCollisions(true);
			v:GetPhysicsObject():EnableCollisions(false)
		end;
	end;
end);