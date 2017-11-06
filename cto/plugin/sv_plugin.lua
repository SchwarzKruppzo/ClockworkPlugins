local cwCTO = cwCTO;
local Clockwork = Clockwork;

cwCTO.printServerDebug = false;
cwCTO.cameraData = cwCTO.cameraData or {};
cwCTO.fixedCameras = cwCTO.fixedCameras or false;
cwCTO.outputEntity = cwCTO.outputEntity or nil;
cwCTO.socioStatus = cwCTO.socioStatus or "GREEN";

function cwCTO:SafelyPrepareCamera(combineCamera)
	if (not IsValid(self.outputEntity)) then
		self.outputEntity = ents.Create("base_entity");
		self.outputEntity:SetName("__cwctohook");

		function self.outputEntity:AcceptInput(inputName, activator, called, data)
			if (data == "OnFoundPlayer") then
				cwCTO:CombineCameraFoundPlayer(called, activator);
			end;
		end;

		self.outputEntity:Spawn();
		self.outputEntity:Activate();
	end;

	combineCamera:Fire("addoutput", "OnFoundPlayer __cwctohook:cwcto:OnFoundPlayer:0:-1");
	self.cameraData[combineCamera] = {};

	if (self.fixedCameras) then
		if (not combineCamera:CreatedByMap()) then
			-- Essentially statics the NPC so that it will load when the server restarts.
			combineCamera:SetNetworkedString( "cw_Name", " " );
			combineCamera:SetNetworkedString( "cw_Title", " " );
		end;
	end;
end;

function cwCTO:CombineCameraFoundPlayer(combineCamera, player)
	if (self.cameraData[combineCamera] and not Clockwork.player:IsNoClipping(player)) then
		if (not self.cameraData[combineCamera][player]) then
			self.cameraData[combineCamera][player] = {};
		end;
	end;
end;

-- Called every tick.
function cwCTO:Tick()
	local networkedCameraData = {};

	for combineCamera, data in pairs(self.cameraData) do
		if (not IsValid(combineCamera)) then
			self.cameraData[combineCamera] = nil;
		elseif (self:isCameraEnabled(combineCamera)) then
			local camPos = combineCamera:GetPos();

			for player, plyData in pairs(data) do
				if (not IsValid(player)) then
					data[player] = nil;
				else
					if (camPos:Distance(player:GetPos()) > 450 or not combineCamera:IsLineOfSightClear(player)) then
						data[player] = nil;
					elseif (#data[player] < 1) then
						local violations = {};

						if (player:IsRunning()) then
							violations[#violations + 1] = self.VIOLATION_RUNNING;
						end;

						if (player:IsJogging()) then
							violations[#violations + 1] = self.VIOLATION_JOGGING;
						end;

						if (player.m_bJumping) then
							violations[#violations + 1] = self.VIOLATION_JUMPING;
						end;

						if (player:Crouching()) then
							violations[#violations + 1] = self.VIOLATION_CROUCHING;
						end;

						if (player:GetRagdollState() ~= RAGDOLL_NONE and player:GetRagdollState() ~= RAGDOLL_RESET) then
							violations[#violations + 1] = self.VIOLATION_FALLEN_OVER;
						end;

						if (#violations > 0) then
							if not (Schema:PlayerIsCombine(player) and not player:GetCharacterData("IsBiosignalGone")) then
								data[player] = violations;
								combineCamera:Fire("SetIdle");
								combineCamera:Fire("SetAngry");

								Schema:AddCombineDisplayLine("Movement violation(s) sighted by C-i" .. combineCamera:EntIndex() .. "...", Color(255, 128, 0, 255));
							end;
						end;
					end;
				end;
			end;

			networkedCameraData[combineCamera:EntIndex()] = data;
		else
			networkedCameraData[combineCamera:EntIndex()] = 0;
		end;
	end;

	local players = {};

	for k, v in ipairs( _player.GetAll() ) do
		if (Schema:PlayerIsCombine(v) and not v:GetCharacterData("IsBiosignalGone")) then
			players[#players + 1] = v;
		end;
	end;

	Clockwork.datastream:Start(players, "UpdateBiosignalCameraData", networkedCameraData);
end;

function cwCTO:DoPostBiosignalLoss(player)
	--player:SetSharedVar("IsBiosignalGone", true);
	player:SetCharacterData("IsBiosignalGone", true);

	local location = Schema:PlayerGetLocation(player);

	local digits = string.match(player:Name(), "%d%d%d%d?%d?") or 0;

	-- Alert all other units.
	Schema:AddCombineDisplayLine("Downloading lost biosignal...", Color(255, 255, 255, 255));
	Schema:AddCombineDisplayLine("WARNING! Biosignal lost for protection team unit "..digits.." at "..location.."...", Color(255, 0, 0, 255));
	for k, v in ipairs( _player.GetAll() ) do
		if (Schema:PlayerIsCombine(v) and v ~= player and not v:GetCharacterData("IsBiosignalGone")) then
			v:EmitSound("npc/metropolice/vo/on"..math.random(1, 2)..".wav");
			v:EmitSound("npc/overwatch/radiovoice/lostbiosignalforunit.wav");
		end;
	end;

	if (digits) then
		local englishDigits = {
			["0"] = "zero",
			["1"] = "one",
			["2"] = "two",
			["3"] = "three",
			["4"] = "four",
			["5"] = "five",
			["6"] = "six",
			["7"] = "seven",
			["8"] = "eight",
			["9"] = "nine"
		};

		for k, v in ipairs( _player.GetAll() ) do
			for i = 1, string.len(digits) do
				timer.Simple(2.1 + ((i - 1) * 0.5), function()
					local voNum = englishDigits[string.sub(digits, i, i)];

					if (Schema:PlayerIsCombine(v) and v ~= player and not v:GetCharacterData("IsBiosignalGone")) then
						v:EmitSound("npc/overwatch/radiovoice/"..voNum..".wav");
					end;
				end);
			end;
		end;

		timer.Simple(2.1 + (string.len(digits) * 0.5), function()
			for k, v in ipairs( _player.GetAll() ) do
				if (Schema:PlayerIsCombine(v) and v ~= player and not v:GetCharacterData("IsBiosignalGone")) then
					v:EmitSound("npc/overwatch/radiovoice/remainingunitscontain.wav");
					timer.Simple(1.4, function()
						v:EmitSound("npc/metropolice/vo/off"..math.random(1, 4)..".wav")
					end);
				end;
			end;
		end);
	end;
end;

function cwCTO:SetPlayerBiosignal(player, bEnable)
	if (Schema:PlayerIsCombine(player)) then
		local isDisabledAlready = player:GetCharacterData("IsBiosignalGone");

		if (bEnable and not isDisabledAlready) then
			return self.ERROR_ALREADY_ENABLED;
		elseif (not bEnable and isDisabledAlready) then
			return self.ERROR_ALREADY_DISABLED;
		else
			if (bEnable) then
				--player:SetSharedVar("IsBiosignalGone", false);
				player:SetCharacterData("IsBiosignalGone", false);

				timer.Simple(0.1, function()

					local location = Schema:PlayerGetLocation(player);

					-- Alert this unit.
					Schema:AddCombineDisplayLine("Connection restored...", Color(0, 255, 0, 255), player);

					local digits = string.match(player:Name(), "%d%d%d%d?%d?") or 0;

					-- Alert all units.
					Schema:AddCombineDisplayLine("Downloading found biosignal...", Color(255, 255, 255, 255));
					Schema:AddCombineDisplayLine("ALERT! Noncohesive biosignal found for protection team unit "..digits.." at "..location.."...", Color(0, 255, 0, 255));

					for k, v in ipairs( _player.GetAll() ) do
						if (Schema:PlayerIsCombine(v) and not v:GetCharacterData("IsBiosignalGone")) then
							v:EmitSound("npc/metropolice/vo/on"..math.random(1, 2)..".wav");
							v:EmitSound("npc/overwatch/radiovoice/engagingteamisnoncohesive.wav");
						end;
					end;

					timer.Simple(1.5, function()
						for k, v in ipairs( _player.GetAll() ) do
							if (Schema:PlayerIsCombine(v) and not v:GetCharacterData("IsBiosignalGone")) then
								v:EmitSound("npc/metropolice/vo/off"..math.random(1, 4)..".wav");
							end;
						end;
					end);

				end);
			else
				-- Alert this unit.
				Schema:AddCombineDisplayLine("ERROR! Shutting down...", Color(255, 0, 0, 255), player);

				self:DoPostBiosignalLoss(player);
			end;

			return self.ERROR_NONE;
		end;
	else
		return self.ERROR_NOT_COMBINE;
	end;
end;

-- Called just after a player spawns.
function cwCTO:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	--player:SetSharedVar("IsBiosignalGone", false);

	if (Schema:PlayerIsCombine(player)) then
		Clockwork.datastream:Start(player, "RecalculateHUDObjectives", {cwCTO.socioStatus, Schema.combineObjectives});

		if (player:GetCharacterData("IsBiosignalGone")) then
			Clockwork.player:Notify(player, "Note: Your character currently has no biosignal.");
		end;
	end;

	if (not self.fixedCameras) then
		for combineCamera, data in pairs(self.cameraData) do
			-- This is documented as the "Start Inactive" flag by Valve for combine cameras.
			if (not combineCamera:HasSpawnFlags(SF_NPC_WAIT_FOR_SCRIPT)) then
				combineCamera:Fire("Enable");
			end;
			if (not combineCamera:CreatedByMap()) then
				-- Essentially statics the NPC so that it will load when the server restarts.
				combineCamera:SetNetworkedString( "cw_Name", " " );
				combineCamera:SetNetworkedString( "cw_Title", " " );
			end;
		end;

		self.fixedCameras = true;
	end;
end;

function cwCTO:DispatchRequestSignal(player, text)
	local players = {};

	for k, v in ipairs( _player.GetAll() ) do
		if (Schema:PlayerIsCombine(v) and not v:GetCharacterData("IsBiosignalGone")) then
			players[#players + 1] = v;

			v:EmitSound("npc/metropolice/vo/on"..math.random(1, 2)..".wav");
			v:EmitSound("npc/overwatch/radiovoice/allteamsrespondcode3.wav");
		end;
	end;

	timer.Simple(1.8, function()
		for k, v in ipairs( _player.GetAll() ) do
			if (Schema:PlayerIsCombine(v) and not v:GetCharacterData("IsBiosignalGone")) then
				v:EmitSound("npc/metropolice/vo/off"..math.random(1, 4)..".wav");
			end;
		end;
	end);

	Clockwork.datastream:Start(players, "CombineRequestSignal", {player, text});

	Schema:AddCombineDisplayLine("Assistance request received...", Color(175, 125, 100, 255));
end;

-- Called when a player has been ragdolled.
function cwCTO:PlayerRagdolled(player, state, ragdoll)
	if (Schema:PlayerIsCombine(player) and not player:GetCharacterData("IsBiosignalGone")) then
		if (state == RAGDOLL_KNOCKEDOUT) then
			local location = Schema:PlayerGetLocation(player);
			local digits = string.match(player:Name(), "%d%d%d%d?%d?") or 0;

			Schema:AddCombineDisplayLine("Downloading trauma packet...", Color(255, 255, 255, 255));
			Schema:AddCombineDisplayLine("WARNING! Protection team unit "..digits.." lost consciousness at "..location.."...", Color(255, 0, 0, 255));
		end;
	end;
end;

-- Called when the plugin is initialized.
-- Using to override schema functions. Hacky, I know, but there is no other way :(
function cwCTO:Initialize()
	-- Called when a player dies.
	function Schema:PlayerDeath(player, inflictor, attacker, damageInfo)
		if (self:PlayerIsCombine(player)) then
			local location = self:PlayerGetLocation(player);

			if (not player:GetCharacterData("IsBiosignalGone")) then
				cwCTO:DoPostBiosignalLoss(player);
			end;

			if (self.scanners[player]) then
				if (IsValid( self.scanners[player][1] )) then
					if (damageInfo ~= true) then
						self.scanners[player][1]:TakeDamage(self.scanners[player][1]:Health() + 100);
					end;
				end;
			end;
		end;

		if (not player:GetCharacterData("permakilled")) then
			if (( attacker:IsPlayer() or attacker:IsNPC() ) and damageInfo) then
				local miscellaneousDamage = damageInfo:IsBulletDamage() or damageInfo:IsFallDamage() or damageInfo:IsExplosionDamage();
				local meleeDamage = damageInfo:IsDamageType(DMG_CLUB) or damageInfo:IsDamageType(DMG_SLASH);

				if (miscellaneousDamage or meleeDamage) then
					if (Clockwork.kernel:GetSharedVar("PKMode") == 1) then
						self:PermaKillPlayer(player, player:GetRagdollEntity());
					end;
				end;
			end;
		end;
	end;

	-- Called when a player's death sound should be played.
	function Schema:PlayerPlayDeathSound(player, gender)
		if (self:PlayerIsCombine(player)) then
			local sound = "npc/metropolice/die"..math.random(1, 4)..".wav";

			if (not player:GetCharacterData("IsBiosignalGone")) then
				for k, v in ipairs( _player.GetAll() ) do
					if (v:HasInitialized()) then
						if (self:PlayerIsCombine(v) and not v:GetCharacterData("IsBiosignalGone")) then
							v:EmitSound(sound);
						end;
					end;
				end;
			end;

			return sound;
		end;
	end;

	-- A function to add a Combine display line.
	function Schema:AddCombineDisplayLine(text, color, player, exclude)
		-- Here we modify some default stuff without overwriting the entire fucking Schema:EntityTakeDamage function.
		if (string.StartWith(text, "WARNING! Protection team unit enduring physical bodily trauma at ") and player == nil and IsValid(exclude)) then
			local location = self:PlayerGetLocation(exclude);
			local digits = string.match(exclude:Name(), "%d%d%d%d?%d?") or 0;

			text = "WARNING! Protection team unit "..digits.." enduring physical body trauma at "..location.."...";
		end;

		if (string.StartWith(text, "Downloading recent objectives...")) then
			timer.Simple(0.1, function()
				local players = {};

				for k, v in ipairs( _player.GetAll() ) do
					if (self:PlayerIsCombine(v) and v ~= exclude and not v:GetCharacterData("IsBiosignalGone")) then
						players[#players + 1] = v;
					end;
				end;

				Clockwork.datastream:Start(players, "RecalculateHUDObjectives", {cwCTO.socioStatus, Schema.combineObjectives});
			end);
		end;

		if (player) then
			Clockwork.datastream:Start( player, "CombineDisplayLine", {text, color} );
			if (cwCTO.printServerDebug) then
				print("Schema:AddCombineDisplayLine", text, color, player, exclude);
			end;
		elseif not (IsValid(exclude) and exclude:GetCharacterData("IsBiosignalGone")) then
			local players = {};

			for k, v in ipairs( _player.GetAll() ) do
				if (self:PlayerIsCombine(v) and v ~= exclude and not v:GetCharacterData("IsBiosignalGone")) then
					players[#players + 1] = v;
				end;
			end;

			Clockwork.datastream:Start(players, "CombineDisplayLine", {text, color});
			if (cwCTO.printServerDebug) then
				print("Schema:AddCombineDisplayLine", text, color, player, exclude, "#players:", #players);
				PrintTable(players);
			end;
		end;
	end;
end;

-- Called when Clockwork has loaded all of the entities.
function cwCTO:ClockworkInitPostEntity()
	self:LoadCameraTerminals();
	for k, v in pairs( ents.FindByClass("npc_combine_camera") ) do
		if (self.cameraData[v] == nil) then
			self:SafelyPrepareCamera(v);
		end;
	end;
end;

-- Called right after an Entity has been created.
function cwCTO:OnEntityCreated(entity)
	if (entity:GetClass() == "npc_combine_camera") then
		if (self.cameraData[entity] == nil) then
			self:SafelyPrepareCamera(entity);
		end;
	end;
end;

-- Called just after data should be saved.
function cwCTO:PostSaveData()
	self:SaveCameraTerminals();
end;

-- Called when an entity's menu option should be handled.
function cwCTO:EntityHandleMenuOption(player, entity, option, arguments)
	local class = entity:GetClass();

	if (class == "cw_ctocameraterminal" and string.StartWith(arguments, "cwCameraOpen")) then
		if (not Schema:PlayerIsCombine(player)) then
			Clockwork.player:Notify(player, "You are not the Combine!");
			return;
		end;

		local camID = string.sub(arguments, string.len("cwCameraOpen") + 1);
		local combineCamera = Entity(camID);

		if (IsValid(combineCamera) and combineCamera:GetClass() == "npc_combine_camera") then
			entity:SetNWEntity("camera", combineCamera);
			entity:EmitSound("weapons/ar2/ar2_reload_rotate.wav", 60);
		elseif (camID == "0") then
			entity:SetNWEntity("camera", entity);
			entity:EmitSound("weapons/ar2/ar2_reload_push.wav", 60);
		end;
	end;
end;

-- Called when a player's visibility should be set up.
function cwCTO:SetupPlayerVisibility(player)
	for k, v in pairs(ents.FindByClass("cw_ctocameraterminal")) do
		local camera = v:GetNWEntity("camera");
		if (IsValid(camera) and player:IsLineOfSightClear(v)) then
			AddOriginToPVS(camera:GetPos() + Vector("0 0 -10"));
		end;
	end;
end;

-- A function to load the camera terminals.
function cwCTO:LoadCameraTerminals()
	local cameraTerminals = Clockwork.kernel:RestoreSchemaData("plugins/cameraterminals/"..game.GetMap());

	for k, v in pairs(cameraTerminals) do
		local entity = ents.Create("cw_ctocameraterminal");

		entity:SetPos(v.position);
		entity:Spawn();

		if ( IsValid(entity) ) then
			entity:SetAngles(v.angles);
		end;
	end;
end;

-- A function to save the camera terminals.
function cwCTO:SaveCameraTerminals()
	local cameraTerminals = {};

	for k, v in pairs(ents.FindByClass("cw_ctocameraterminal")) do
		cameraTerminals[#cameraTerminals + 1] = {
			angles = v:GetAngles(),
			position = v:GetPos()
		};
	end;

	Clockwork.kernel:SaveSchemaData("plugins/cameraterminals/"..game.GetMap(), cameraTerminals);
end;
