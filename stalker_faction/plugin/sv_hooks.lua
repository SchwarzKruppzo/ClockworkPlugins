-- Called when a player's weapons should be given.
function PLUGIN:PlayerGiveWeapons(player)
	if (player:GetFaction() == FACTION_STALKER) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_laser");
	end;
end;

-- Called when a player's death sound should be played.
function PLUGIN:PlayerPlayDeathSound(player, gender)
	local stalkersound = "npc/stalker/go_alert2.wav";
		
	for k, v in ipairs( _player.GetAll() ) do
		if (v:HasInitialized()) then
			 if	( PLUGIN:PlayerIsStalker(v) ) then
				v:EmitSound(stalkersound);
			end;
		end;
	end;
		
	if ( PLUGIN:PlayerIsStalker(player) ) then
		return stalkersound;
	end;
end;

-- Called when a player's pain sound should be played.
function PLUGIN:PlayerPlayPainSound(player, gender, damageInfo, hitGroup)
	if (self:PlayerIsStalker(player)) then
		return "npc/stalker/stalker_pain"..math.random(1, 4)..".wav";
	end;
end;

-- Called when an entity takes damage.
function Schema:EntityTakeDamage(entity, damageInfo)
	local player = Clockwork.entity:GetPlayer(entity);
	local attacker = damageInfo:GetAttacker();
	local inflictor = damageInfo:GetInflictor();
	local damage = damageInfo:GetDamage();
	local curTime = CurTime();
	local doDoorDamage = nil;
	
	if (player) then
		if (!player.nextEnduranceTime or CurTime() > player.nextEnduranceTime) then
			player:ProgressAttribute(ATB_ENDURANCE, math.Clamp(damageInfo:GetDamage(), 0, 75) / 10, true);
			player.nextEnduranceTime = CurTime() + 2;
		end;
		
		if (self.scanners[player]) then
			entity:EmitSound("npc/scanner/scanner_pain"..math.random(1, 2)..".wav");
			
			if (entity:Health() > 50 and entity:Health() - damageInfo:GetDamage() <= 50) then
				entity:EmitSound("npc/scanner/scanner_siren1.wav");
			elseif (entity:Health() > 25 and entity:Health() - damageInfo:GetDamage() <= 25) then
				entity:EmitSound("npc/scanner/scanner_siren2.wav");
			end;
		end;
		
		if (PLUGIN:PlayerIsStalker(player)) and (damageInfo:IsDamageType(DMG_FALL))then
			damageInfo:ScaleDamage(0);
			player:EmitSound("npc/stalker/breathing3.wav");
		end
		
		if (attacker:IsPlayer() and self:PlayerIsCombine(player)) then
			if (attacker != player) then
				local location = Schema:PlayerGetLocation(player);
				
				if (!player.nextUnderFire or curTime >= player.nextUnderFire) then
					player.nextUnderFire = curTime + 15;
					
					Schema:AddCombineDisplayLine("Downloading trauma packet...", Color(255, 255, 255, 255), nil, player);
					Schema:AddCombineDisplayLine("WARNING! Protection team unit enduring physical bodily trauma at "..location.."...", Color(255, 0, 0, 255), nil, player);
				end;
			end;
		end;
	end;
	
	if (attacker:IsPlayer()) then
		local strength = Clockwork.attributes:Fraction(attacker, ATB_STRENGTH, 1, 0.5);
		local weapon = Clockwork.player:GetWeaponClass(attacker);
		
		if (damageInfo:IsDamageType(DMG_CLUB) or damageInfo:IsDamageType(DMG_SLASH)) then
			damageInfo:ScaleDamage(1 + strength);
		end;
		
		if (weapon == "weapon_357") then
			damageInfo:ScaleDamage(0.25);
		elseif (weapon == "weapon_crossbow") then
			damageInfo:ScaleDamage(2);
		elseif (weapon == "weapon_shotgun") then
			damageInfo:ScaleDamage(3);
			
			doDoorDamage = true;
		elseif (weapon == "weapon_crowbar") then
			damageInfo:ScaleDamage(0.25);
		elseif (weapon == "cw_stunstick") then
			if (player) then
				if (player:Health() <= 10) then
					damageInfo:ScaleDamage(0.5);
				end;
			end;
		end;
		
		if (damageInfo:IsBulletDamage() and weapon != "weapon_shotgun") then
			if (!IsValid(entity.combineLock) and !IsValid(entity.breach)) then
				if (string.lower( entity:GetClass() ) == "prop_door_rotating") then
					if (!Clockwork.entity:IsDoorFalse(entity)) then
						local damagePosition = damageInfo:GetDamagePosition();
						
						if (entity:WorldToLocal(damagePosition):Distance( Vector(-1.0313, 41.8047, -8.1611) ) <= 8) then
							entity.doorHealth = math.min( (entity.doorHealth or 50) - damageInfo:GetDamage(), 0 );
							
							local effectData = EffectData();
							
							effectData:SetStart(damagePosition);
							effectData:SetOrigin(damagePosition);
							effectData:SetScale(8);
							
							util.Effect("GlassImpact", effectData, true, true);
							
							if (entity.doorHealth <= 0) then
								Clockwork.entity:OpenDoor( entity, 0, true, true, attacker:GetPos() );
								
								entity.doorHealth = 50;
							else
								Clockwork.kernel:CreateTimer("reset_door_health_"..entity:EntIndex(), 60, 1, function()
									if (IsValid(entity)) then
										entity.doorHealth = 50;
									end;
								end);
							end;
						end;
					end;
				end;
			end;
		end;
		
		if (damageInfo:IsExplosionDamage()) then
			damageInfo:ScaleDamage(2);
		end;
	elseif (attacker:IsNPC()) then
		damageInfo:ScaleDamage(0.5);
	end;
	
	if (damageInfo:IsExplosionDamage() or doDoorDamage) then
		if (!IsValid(entity.combineLock) and !IsValid(entity.breach)) then
			if (string.lower( entity:GetClass() ) == "prop_door_rotating") then
				if (!Clockwork.entity:IsDoorFalse(entity)) then
					if (attacker:GetPos():Distance( entity:GetPos() ) <= 96) then
						entity.doorHealth = math.min( (entity.doorHealth or 50) - damageInfo:GetDamage(), 0 );
						
						local damagePosition = damageInfo:GetDamagePosition();
						local effectData = EffectData();
						
						effectData:SetStart(damagePosition);
						effectData:SetOrigin(damagePosition);
						effectData:SetScale(8);
						
						util.Effect("GlassImpact", effectData, true, true);
						
						if (entity.doorHealth <= 0) then
							self:BustDownDoor(attacker, entity);
							
							entity.doorHealth = 50;
						else
							Clockwork.kernel:CreateTimer("reset_door_health_"..entity:EntIndex(), 60, 1, function()
								if (IsValid(entity)) then
									entity.doorHealth = 50;
								end;
							end);
						end;
					end;
				end;
			end;
		end;
	end;
end;