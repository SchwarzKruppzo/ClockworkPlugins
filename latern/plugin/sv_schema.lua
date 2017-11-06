local PLUGIN = PLUGIN;

-- A function to load the latern.
function PLUGIN:LoadLatern()
	local latern = Clockwork.kernel:RestoreSchemaData( "plugins/latern/"..game.GetMap() );

	for k, v in pairs(latern) do
		local entity = ents.Create("cw_latern");
		
		Clockwork.player:GivePropertyOffline(v.key, v.uniqueID, entity);
		
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:Spawn();
		
		if (!v.moveable) then
			local physicsObject = entity:GetPhysicsObject();
			
			if ( IsValid(physicsObject) ) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
end;

-- A function to save laterns.
function PLUGIN:SaveLatern()
	local latern = {};

	for k, v in pairs( ents.FindByClass("cw_latern") ) do
		local physicsObject = v:GetPhysicsObject();
		local moveable;
		
		if ( IsValid(physicsObject) ) then
			moveable = physicsObject:IsMoveable();
		end;
		
		latern[#latern + 1] = {
			key = Clockwork.entity:QueryProperty(v, "key"),
			angles = v:GetAngles(),
			moveable = moveable,
			uniqueID = Clockwork.entity:QueryProperty(v, "uniqueID"),
			position = v:GetPos(),
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/latern/"..game.GetMap(), latern);
end;