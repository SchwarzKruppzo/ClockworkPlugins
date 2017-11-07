local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- A function to reset a player's scanner.
function Schema:ResetPlayerScanner(player, noMessage)
	if (self.scanners[player]) then
		local scanner = self.scanners[player][1];
		local marker = self.scanners[player][2];
		local spotlight = self.scanners[player][3];
		
		if (IsValid(scanner)) then
			scanner:Remove();
		end;
		
		if (IsValid(marker)) then
			marker:Remove();
		end;
		
		if(IsValid(spotlight)) then
			self:RemoveSpotlight(spotlight);
		end;
		
		self.scanners[player] = nil;
		
		if (!noMessage) then
			player:SetMoveType(MOVETYPE_WALK);
			player:UnSpectate();
			player:KillSilent();
		end;
	end;
end;

-- A function to make a player a scanner.
function Schema:MakePlayerScanner(player, noMessage, lightSpawn)
	self:ResetPlayerScanner(player, noMessage);
	
	local scannerClass = "npc_cscanner";
	local spotlightPosition = Vector(7.5910, -0.4793, 14.0038);
	
	-- Check if a statement is true.
	if ( self:IsPlayerCombineRank(player, "SYNTH") ) then
		scannerClass = "npc_clawscanner";
		spotlightPosition = Vector(7.4746, -6.0824, 2.1015);
	end;
	
	local spotlight = ents.Create("point_spotlight");
	local position = player:GetShootPos();
	local uniqueID = player:UniqueID();
	local scanner = ents.Create(scannerClass);
	local marker = ents.Create("path_corner");
	
	Clockwork.entity:SetPlayer(scanner, player);
	
	scanner:SetPos( position + Vector(0, 0, 16) );
	scanner:SetAngles( player:GetAimVector():Angle() );
	scanner:SetKeyValue("targetname", "scanner_"..uniqueID);
	scanner:SetKeyValue("spawnflags", 8592);
	scanner:SetKeyValue("renderfx", 0);
	scanner:Spawn(); scanner:Activate();

	spotlight:SetParent(scanner);
	spotlight:SetKeyValue("spotlightlength", 320);
	spotlight:SetKeyValue("spotlightwidth", 16);
	spotlight:SetKeyValue("targetname", "spotlight_"..uniqueID);
	spotlight:SetLocalPos(spotlightPosition);
	spotlight:SetLocalAngles( Angle(0, 0, 0) );
	spotlight:Spawn(); spotlight:Activate();
	
	marker:SetKeyValue("targetname", "marker_"..uniqueID);
	marker:SetPos(position);
	marker:Spawn(); marker:Activate();
	
	if (!lightSpawn) then
		player:Flashlight(false);
		player:RunCommand("-duck");
		
		if (scannerClass == "npc_clawscanner") then
			player:SetHealth(200);
		end;
	end;
	
	player:SetArmor(0);
	player:Spectate(OBS_MODE_CHASE);
	player:StripWeapons();
	player:SetSharedVar("scanner", scanner:EntIndex());
	player:SetMoveType(MOVETYPE_OBSERVER);
	player:SpectateEntity(scanner);
	
	scanner:SetMaxHealth( player:GetMaxHealth() );
	scanner:SetHealth( player:Health() );
	scanner:Fire("SetDistanceOverride", 64, 0);
	scanner:Fire("SetFollowTarget", "marker_"..uniqueID, 0);
	
	self.scanners[player] = {scanner, marker, spotlight};

	Clockwork.kernel:CreateTimer("Scanner Spotlight: "..uniqueID, 0.01, 1, function()
		if ( IsValid(spotlight) ) then
			spotlight:Fire("LightOn", "", 0);
		end;
	end);
	
	Clockwork.kernel:CreateTimer("scanner_sound_"..uniqueID, 0.01, 1, function()
		if (IsValid(scanner)) then
			scanner.flyLoop = CreateSound(scanner, "npc/scanner/cbot_fly_loop.wav");
			scanner.flyLoop:Play();
		end;
	end);
	
	scanner:CallOnRemove("Scanner Sound", function(scanner)
		if (scanner.flyLoop) then
			scanner.flyLoop:Stop();
		end;
	end);
end;