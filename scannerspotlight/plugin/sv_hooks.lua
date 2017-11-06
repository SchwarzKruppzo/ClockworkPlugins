local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when a player presses a key.
function Schema:KeyPress(player, key)
	if (key == IN_USE) then
		if (!self.scanners[player]) then
			local untieTime = Schema:GetDexterityTime(player);
			local target = player:GetEyeTraceNoCursor().Entity;
			local entity = target;
			
			if (IsValid(target)) then
				target = Clockwork.entity:GetPlayer(target);
				
				if (target and player:GetSharedVar("tied") == 0) then
					if (target:GetShootPos():Distance( player:GetShootPos() ) <= 192) then
						if (target:GetSharedVar("tied") != 0) then
							Clockwork.player:SetAction(player, "untie", untieTime);
							
							Clockwork.player:EntityConditionTimer(player, target, entity, untieTime, 192, function()
								return player:Alive() and !player:IsRagdolled() and player:GetSharedVar("tied") == 0;
							end, function(success)
								if (success) then
									self:TiePlayer(target, false);
									
									player:ProgressAttribute(ATB_DEXTERITY, 15, true);
								end;
								
								Clockwork.player:SetAction(player, "untie", false);
							end);
						end;
					end;
				end;
			end;
		end;
	elseif (key == IN_ATTACK) then
		if (self.scanners[player]) then
			local scanner = self.scanners[player][1];
			
			if (IsValid(scanner)) then
				player.nextScannerSound = CurTime() + math.random(8, 48);
				
				scanner:EmitSound( self.scannerSounds[ math.random(1, #self.scannerSounds) ] );
			end;
		end;
	elseif (key == IN_ATTACK2) then
		if ( self.scanners[player] ) then
			local spotlight = self.scanners[player][3];
			local scanner = self.scanners[player][1];
			local curTime = CurTime();

			if (IsValid(scanner) and IsValid(spotlight)) then
				if (!spotlight._NextToggle or curTime >= spotlight._NextToggle) then
					if (!spotlight._Disabled) then
						spotlight:Fire("LightOff", "", 0);
					else
						spotlight:Fire("LightOn", "", 0);
					end;

					scanner:EmitSound("items/flashlight1.wav");

					spotlight._Disabled = !spotlight._Disabled;
				end;
			end;
		end;
	elseif (key == IN_RELOAD) then
		if (self.scanners[player]) then
			local scanner = self.scanners[player][1];
			local curTime = CurTime();
			local marker = self.scanners[player][2];
			
			if (IsValid(scanner)) then
				local position = scanner:GetPos();
				
				for k, v in ipairs( ents.FindInSphere(position, 384) ) do
					if (v:IsPlayer() and v:HasInitialized() and !self:PlayerIsCombine(v)) then
						local playerPosition = v:GetPos();
						local scannerDot = scanner:GetAimVector():Dot( (playerPosition - position):GetNormal() );
						local playerDot = v:GetAimVector():Dot( (position - playerPosition):GetNormal() );
						local threshold = 0.2 + math.Clamp( (0.6 / 384) * playerPosition:Distance(position), 0, 0.6 );
						
						if (Clockwork.player:CanSeeEntity( v, scanner, 0.9, {marker} ) and playerDot >= threshold and scannerDot >= threshold) then
							if (player != v) then
								if (v:GetFaction() == FACTION_CITIZEN) then
									if (!v:GetForcedAnimation()) then
										v:SetForcedAnimation("photo_react_blind", 2, function(player)
											player:Freeze(true);
										end, function(player)
											player:Freeze(false);
										end);
									end;
								end;
								
								Clockwork.datastream:Start(v, "Stunned", 3);
							end;
						end;
					end;
				end;
				
				scanner:EmitSound("npc/scanner/scanner_photo1.wav");
			end;
		end;
	elseif (key == IN_WALK) then
		if (self.scanners[player]) then
			Clockwork.player:RunClockworkCommand(player, "CharFollow");
		end;
	end;
end;

-- Called each tick.
function Schema:Tick()
	local scannerList = self.scanners;

	for k, v in pairs(scannerList) do
		local scanner = v[1];
		local marker = v[2];
		local spotlight = v[3];

		if (IsValid(k)) then
			if (IsValid(scanner) and IsValid(marker)) then
				if (k:KeyDown(IN_FORWARD)) then
					local position = scanner:GetPos() + (scanner:GetForward() * 25) + (scanner:GetUp() * -64);
					
					if (k:KeyDown(IN_SPEED)) then
						marker:SetPos( position + (k:GetAimVector() * 64) );
					else
						marker:SetPos( position + (k:GetAimVector() * 128) );
					end;
					
					scanner.followTarget = nil;
				end;

				if (IsValid(scanner.followTarget)) then
					scanner:Input("SetFollowTarget", scanner.followTarget, scanner.followTarget, "!activator");
				else
					scanner:Fire("SetFollowTarget", "marker_"..k:UniqueID(), 0);
				end;

				if (scannerClass == "npc_cscanner" and self:IsPlayerCombineRank(k, "SYNTH")) then
					self:MakePlayerScanner(k, true);
				elseif (scannerClass == "npc_clawscanner" and !self:IsPlayerCombineRank(k, "SYNTH")) then
					self:MakePlayerScanner(k, true);
				end;
			else
				self:ResetPlayerScanner(k);
			end;
		else
			if (IsValid(scanner)) then
				scanner:Remove();
			end;

			if (IsValid(marker)) then
				marker:Remove();
			end;

			if (IsValid(spotlight)) then
				self:RemoveSpotlight(spotlight);
			end;

			self.scanners[k] = nil;
		end;
	end;
end;