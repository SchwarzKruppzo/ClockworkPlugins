local PLUGIN = PLUGIN;

local projectiles = {};
projectiles["crossbow_bolt"]		 	= true;
projectiles["grenade_ar2"]			 	= true;
projectiles["hunter_flechette"]	 		= true;
projectiles["npc_clawscanner"]		 	= true;
projectiles["npc_combine_camera"]	 	= true;
projectiles["npc_combine_s"]		 	= true;
projectiles["npc_combinedropship"]	 	= true;
projectiles["npc_combinegunship"]	 	= true;
projectiles["npc_cscanner"]		 		= true;
projectiles["npc_grenade_frag"]			= true;
projectiles["npc_helicopter"]		 	= true;
projectiles["npc_hunter"]			 	= true;
projectiles["npc_manhack"]			 	= true;
projectiles["npc_metropolice"]		 	= true;
projectiles["npc_rollermine"]		 	= true;
projectiles["npc_stalker"]			 	= true;
projectiles["npc_strider"]			 	= true;
projectiles["npc_tripmine"]		 		= true;
projectiles["npc_turret_ceiling"]	 	= true;
projectiles["npc_turret_floor"] 	 	= true;
projectiles["prop_combine_ball"]		= true;
projectiles["prop_physics"]		 		= true;
projectiles["prop_vehicle_zapc"]	 	= true;
projectiles["prop_vehicle_prisoner_pod"]= true;
projectiles["prop_vehicle_jeep"]        = true;
projectiles["prop_vehicle_zapc_rocket"] = true;
projectiles["rpg_missile"]			 	= true;

hook.Add("ShouldCollide", "forcefield_ShouldCollide", function(a, b)

	local player;
	local entity;

	if (a:IsPlayer()) then
		player = a;
		entity = b;
	elseif (b:IsPlayer()) then
		player = b;
		entity = a;
	end;

	if (projectiles[a:GetClass()] and b:GetClass() == "cw_forcefield") then
		return false;
	elseif (projectiles[b:GetClass()] and a:GetClass() == "cw_forcefield") then
		return false;
	end;

	if (IsValid(entity) and entity:GetClass() == "cw_forcefield") then 				 -- If the entity the player is colliding with is valid, and it's our forcefield...
		if (IsValid(player)) then 													 -- Check if the player is still valid...
			if (!entity:GetDTBool(0)) then 											 -- Is the forcefield off?
				return false;
			end;

			if (Schema:PlayerIsCombine(player)) then 		 -- Is the player entity on the list of acceptable entities?
				return false;
			else
				return true;														 -- Failed both checks, they collide with the forcefield.
			end;
		else
			return entity:GetDTBool(0);												 -- Fail-safe, return whether or not the forcefield is on.
		end;
	end;
end);