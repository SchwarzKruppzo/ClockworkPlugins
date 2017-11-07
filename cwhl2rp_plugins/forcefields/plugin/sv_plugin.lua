local Clockwork = Clockwork;

local PLUGIN = PLUGIN;

-- A function to load the fields.
function PLUGIN:LoadFields()
	local fields = Clockwork.kernel:RestoreSchemaData("plugins/ff/"..game.GetMap());
	
	for k, v in pairs(fields) do
		local entity = ents.Create("cw_forcefield");
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:Spawn();
		entity:Activate();

		local physicsObject = entity:GetPhysicsObject();
		
		if ( IsValid(physicsObject) ) then
			physicsObject:EnableMotion(false);
		end;
	end;
end;

-- A function to save the fields.
function PLUGIN:SaveFields()
	local fields = {};
	
	for k, v in pairs(ents.FindByClass("cw_forcefield")) do
		local position = v:GetPos();
		local angles = v:GetAngles();

		fields[#fields + 1] = {
			position = position,
			angles = angles,
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/ff/"..game.GetMap(), fields);
end;