local cwCTO = cwCTO;
local Clockwork = Clockwork;

cwCTO.biosignalLocations = cwCTO.biosignalLocations or {};
cwCTO.requestLocations = cwCTO.requestLocations or {};

cwCTO.cameraData = cwCTO.cameraData or {};
cwCTO.hudObjectives = cwCTO.hudObjectives or {};
cwCTO.socioStatus = cwCTO.socioStatus or "GREEN";

cwCTO.terminalMaterialIdx = cwCTO.terminalMaterialIdx or 0;
cwCTO.terminalsToDraw = cwCTO.terminalsToDraw or {};

cwCTO.debug_paintBenchmark = cwCTO.debug_paintBenchmark or 0;

function cwCTO:UpdateBiosignalLocations()
	local curTime = CurTime();

	-- Clear expired requests.
	for i, data in ipairs(self.requestLocations) do
		if (curTime - data.time >= Clockwork.config:Get("cto_expire_requests"):GetNumber()) then
			self.requestLocations[i] = nil;
		end;
	end;

	-- Clear active biosignals and expired lost biosignals.
	for unit, data in pairs(self.biosignalLocations) do
		if (not IsValid(unit) or not Schema:PlayerIsCombine(unit) or
		(not Clockwork.Client:GetCharacterData("IsBiosignalGone") and not
		unit:GetCharacterData("IsBiosignalGone")) or curTime - data.time >= 120) then
			self.biosignalLocations[unit] = nil;
		end;
		data.isLost = true;
	end;

	-- Add active biosignals, update camera data.
	if (not Clockwork.Client:GetCharacterData("IsBiosignalGone")) then
		for _, v in pairs( _player.GetAll() ) do
			if (Schema:PlayerIsCombine(v) and v ~= Clockwork.Client and not
			v:GetCharacterData("IsBiosignalGone") and v:Alive()) then
				local physBone = v:LookupBone("ValveBiped.Bip01_Head1");
				local position = nil;

				if (physBone) then
					local bonePosition = v:GetBonePosition(physBone);

					if (bonePosition) then
						position = bonePosition + Vector(0, 0, 16);
					end;
				else
					position = v:GetPos() + Vector(0, 0, 80);
				end;

				self.biosignalLocations[v] = {
					pos = position,
					time = curTime,
					isLost = false,
					isKnockedOut = v:GetRagdollState() == RAGDOLL_KNOCKEDOUT,
					digits = string.match(v:Name(), "%d%d%d%d?%d?") or "???"
				};
			end;
		end;
	end;
end;

-- Called when the foreground HUD should be painted.
function cwCTO:HUDPaintForeground()
	local startTime = SysTime();

	if (Schema:PlayerIsCombine(Clockwork.Client)) then
		local colorWhite = Clockwork.option:GetColor("white");
		local colorRed = Color(255, 0, 0, 255);
		local colorObject = Color(150, 150, 200, 255);
		local fontHeight = draw.GetFontHeight("BudgetLabel");

		local curTime = CurTime();

		local lowDetailBox = math.floor(ScrW() / 16);
		local halfScrVector = Vector(ScrW() / 2, ScrH() / 2);
		local lowDetailText = "<...>";

		local requestColor = Color(175, 125, 100, 255);

		local bUnobstruct = Clockwork.config:Get("cto_biosignal_unobstruct"):GetBoolean();
		local biosignalDist = Clockwork.config:Get("cto_biosignal_distance"):GetNumber();

		local beholder = Clockwork.Client;
		local beholderEyePos = beholder:EyePos();

		local biosignalExpiry = Clockwork.config:Get("cto_expire_biosignals"):GetNumber();

		-- Draw unit biosignals.
		for unit, data in pairs(self.biosignalLocations) do
			if (not IsValid(unit) or curTime - data.time >= biosignalExpiry) then
				self.biosignalLocations[unit] = nil;
			elseif (not (not data.isLost and Clockwork.player:IsNoClipping(unit))) then
				local toScreen = data.pos:ToScreen();

				-- Check against visibility configuration.
				if (not data.isLost) and
				((not bUnobstruct and not beholder:IsLineOfSightClear(unit))
				or (biosignalDist > 0 and beholderEyePos:Distance(unit:GetPos()) > biosignalDist)) then
					toScreen.visible = false;
				end;

				if (toScreen.visible) then
					local text = "<:: " .. data.digits .. " ::>";
					local color = _team.GetColor(unit:Team()) or colorWhite;

					local showDetail = (Vector(toScreen.x, toScreen.y):Distance(halfScrVector) <= lowDetailBox);

					if (showDetail) then
						text = "<:: " .. unit:Name() .. " ::>";
					end;

					local timeSince = math.Round(curTime - data.time, 2);
					timeSince = timeSince .. string.rep(0, (string.len(math.floor(timeSince)) + 3) - string.len(timeSince));

					if (data.isLost) then
						local text2 = "<:: Lost " .. timeSince .. "s ::>";

						local timeUntil = math.Round((biosignalExpiry - (curTime - data.time)), 2);
						timeUntil = timeUntil .. string.rep(0, (string.len(math.floor(timeUntil)) + 3) - string.len(timeUntil));

						draw.SimpleText(text, "BudgetLabel", toScreen.x, toScreen.y, color, 1, 1);
						toScreen.y = toScreen.y + fontHeight;
						draw.SimpleText(text2, "BudgetLabel", toScreen.x, toScreen.y, colorRed, 1, 1);
						toScreen.y = toScreen.y + fontHeight;
						draw.SimpleText("<:: Removing " .. timeUntil .. "s ::>", "BudgetLabel", toScreen.x, toScreen.y, colorRed, 1, 1);
					else
						local text2 = "<:: Received " .. timeSince .. "s ::>";
						draw.SimpleText(text, "BudgetLabel", toScreen.x, toScreen.y, color, 1, 1);
						toScreen.y = toScreen.y + fontHeight;
						draw.SimpleText(showDetail and text2 or lowDetailText, "BudgetLabel", toScreen.x, toScreen.y, colorWhite, 1, 1);

						if (data.isKnockedOut) then
							toScreen.y = toScreen.y + fontHeight;
							draw.SimpleText("<:: Unconscious ::>", "BudgetLabel", toScreen.x, toScreen.y, colorRed, 1, 1);
						end;
					end;
				end;
			end;
		end;

		local requestExpiry = Clockwork.config:Get("cto_expire_requests"):GetNumber();

		-- Draw help requests.
		for i, data in ipairs(self.requestLocations) do
			if (curTime - data.time >= requestExpiry) then
				self.requestLocations[i] = nil;
			else
				local toScreen = data.pos:ToScreen();

				if (toScreen.visible) then
					local text2 = "<:: " .. data.text .. " ::>";

					local showDetail = (Vector(toScreen.x, toScreen.y):Distance(halfScrVector) <= lowDetailBox);

					local timeUntil = math.Round((requestExpiry - (curTime - data.time)), 2);
					timeUntil = timeUntil .. string.rep(0, (string.len(math.floor(timeUntil)) + 3) - string.len(timeUntil));

					draw.SimpleText("<:: Assistance Request ::>", "BudgetLabel", toScreen.x, toScreen.y, requestColor, 1, 1);
					toScreen.y = toScreen.y + fontHeight;
					draw.SimpleText(showDetail and text2 or lowDetailText, "BudgetLabel", toScreen.x, toScreen.y, colorWhite, 1, 1);
					toScreen.y = toScreen.y + fontHeight;
					draw.SimpleText("<:: Removing " .. timeUntil .. "s ::>", "BudgetLabel", toScreen.x, toScreen.y, colorRed, 1, 1);
				end;
			end;
		end;

		-- Draw cameras.
		for combineCamera, data in pairs(self.cameraData) do
			if (IsValid(combineCamera)) then
				local toScreen = combineCamera:GetPos():ToScreen();

				local violations = {};

				if (type(data) == "table") then
					for player, vios in pairs(data) do
						for i, vio in ipairs(vios) do
							if (vio == self.VIOLATION_RUNNING) then
								violations[#violations + 1] = "<:: 1xRunning ::>";
							elseif (vio == self.VIOLATION_JOGGING) then
								violations[#violations + 1] = "<:: 1xJogging ::>";
							elseif (vio == self.VIOLATION_JUMPING) then
								violations[#violations + 1] = "<:: 1xJumping ::>";
							elseif (vio == self.VIOLATION_CROUCHING) then
								violations[#violations + 1] = "<:: 1xDucking ::>";
							elseif (vio == self.VIOLATION_FALLEN_OVER) then
								violations[#violations + 1] = "<:: 1xLaying ::>";
							end;
						end;
					end;
				end;

				if (#violations <= 0) and
				((not bUnobstruct and not beholder:IsLineOfSightClear(combineCamera))
				or (biosignalDist > 0 and beholderEyePos:Distance(combineCamera:GetPos()) > biosignalDist)) then
					toScreen.visible = false;
				end;

				if (toScreen.visible) then
					local text1 = "<:: C-i" .. combineCamera:EntIndex() .. " ::>";
					local showDetail = (Vector(toScreen.x, toScreen.y):Distance(halfScrVector) <= lowDetailBox);

					draw.SimpleText(showDetail and text1 or lowDetailText, "BudgetLabel", toScreen.x, toScreen.y, colorObject, 1, 1);

					if (type(data) == "table") then
						local text2 = "<:: " .. table.Count(data) .. " Within Sights ::>";

						toScreen.y = toScreen.y + fontHeight;
						draw.SimpleText(showDetail and text2 or lowDetailText, "BudgetLabel", toScreen.x, toScreen.y, colorWhite, 1, 1);

						if (#violations > 0) then
							toScreen.y = toScreen.y + fontHeight;
							draw.SimpleText("<:: Violations Within Sights ::>", "BudgetLabel", toScreen.x, toScreen.y, colorRed, 1, 1);

							for i, violation in ipairs(violations) do
								toScreen.y = toScreen.y + fontHeight;
								draw.SimpleText(showDetail and violation or lowDetailText, "BudgetLabel", toScreen.x, toScreen.y, colorWhite, 1, 1);
							end;
						end;
					else
						toScreen.y = toScreen.y + fontHeight;
						draw.SimpleText("<:: Disabled ::>", "BudgetLabel", toScreen.x, toScreen.y, colorRed, 1, 1);
					end;
				end;
			end;
		end;

		local maximumDistance = Clockwork.config:Get("cto_citizen_distance"):GetNumber();

		-- If we are using suit zoom.
		if (Clockwork.Client:GetFOV() < 40) then
			maximumDistance = maximumDistance * 3;
		end;

		-- Draw movement violations.
		for _, v in pairs( _player.GetAll() ) do
			if (not (Schema:PlayerIsCombine(v) and not v:GetCharacterData("IsBiosignalGone")) and
			beholderEyePos:Distance(v:GetPos()) <= maximumDistance and not Clockwork.player:IsNoClipping(v)) then
				local physBone = v:LookupBone("ValveBiped.Bip01_Head1");
				local position = nil;

				if (physBone) then
					local bonePosition = v:GetBonePosition(physBone);

					if (bonePosition) then
						position = bonePosition + Vector(0, 0, 16);
					end;
				else
					position = v:GetPos() + Vector(0, 0, 80);
				end;

				local toScreen = position:ToScreen();

				if (toScreen.visible and beholder:IsLineOfSightClear(v)) then
					local showDetail = (Vector(toScreen.x, toScreen.y):Distance(halfScrVector) <= lowDetailBox);

					local CID = v:GetSharedVar("citizenid");
					if (Clockwork.config:Get("cto_use_tag_system"):GetBoolean() and
					beholderEyePos:Distance(v:GetPos()) <= (maximumDistance / 6) and not
					v:GetCharacterData("IsCIDTagGone") and CID ~= "") then
						local text = "<:: c#" .. CID .. " ::>";
						local color = _team.GetColor(v:Team()) or colorWhite;

						draw.SimpleText(showDetail and text or lowDetailText, "BudgetLabel", toScreen.x, toScreen.y, color, 1, 1);
						toScreen.y = toScreen.y + fontHeight;
					end;

					local violations = {};

					if (v:IsRunning()) then violations[#violations + 1] = "<:: 1xRunning ::>"; end;
					if (v:IsJogging()) then violations[#violations + 1] = "<:: 1xJogging ::>"; end;
					if (v.m_bJumping) then violations[#violations + 1] = "<:: 1xJumping ::>"; end;
					if (v:Crouching()) then violations[#violations + 1] = "<:: 1xDucking ::>"; end;
					if (v:GetRagdollState() ~= RAGDOLL_NONE and v:GetRagdollState() ~= RAGDOLL_RESET) then
						violations[#violations + 1] = "<:: 1xLaying ::>";
					end;

					if (#violations > 0) then
						draw.SimpleText("<:: Possible Violation ::>", "BudgetLabel", toScreen.x, toScreen.y, colorRed, 1, 1);

						for i, violation in ipairs(violations) do
							toScreen.y = toScreen.y + fontHeight;
							draw.SimpleText(showDetail and violation or lowDetailText, "BudgetLabel", toScreen.x, toScreen.y, colorWhite, 1, 1);
						end;
					end;
				end;
			end;
		end;
	end;

	self.debug_paintBenchmark = SysTime() - startTime;
end;

Clockwork.datastream:Hook("CombineRequestSignal", function(data)
	local player = data[1];
	local text = data[2];

	if (IsValid(player)) then
		local physBone = player:LookupBone("ValveBiped.Bip01_Head1");
		local position = nil;

		if (physBone) then
			local bonePosition = player:GetBonePosition(physBone);

			if (bonePosition) then
				position = bonePosition + Vector(0, 0, 16);
			end;
		else
			position = player:GetPos() + Vector(0, 0, 80);
		end;

		table.insert(cwCTO.requestLocations, {
			time = CurTime(),
			pos = position,
			text = text
		});
	end;
end);

Clockwork.datastream:Hook("UpdateBiosignalCameraData", function(data)
	local newCameraData = {};

	for entIndex, players in pairs(data) do
		local combineCamera = Entity(entIndex);

		if (IsValid(combineCamera)) then
			newCameraData[combineCamera] = players;
		end;
	end;

	cwCTO.cameraData = newCameraData;
end);

Clockwork.datastream:Hook("RecalculateHUDObjectives", function(data)
	local lines = {};

	for k, v in pairs( string.Split(data[2], "\n") ) do
		if (string.StartWith(v, "^")) then
			table.insert(lines, "<:: " .. string.sub(v, 2) .. " ::>");
		end;
	end;

	cwCTO.socioStatus = data[1];
	cwCTO.hudObjectives = lines;
end);

-- Called when the top screen HUD should be painted.
function cwCTO:HUDPaintTopScreen()
	local blackFadeAlpha = Clockwork.kernel:GetBlackFadeAlpha();
	local colorWhite = Clockwork.option:GetColor("white");

	local info = { x = ScrW() - 8, y = 8 };

	if (Schema:PlayerIsCombine(Clockwork.Client)) then
		local height = draw.GetFontHeight("BudgetLabel");

		local socioColor = self.sociostatusColors[self.socioStatus] or colorWhite;

		if (self.socioStatus == "BLACK") then
			local tsin = TimedSin(1, 0, 255, 0);
			socioColor = Color(tsin, tsin, tsin);
		end;

		socioColor = Color(socioColor.r, socioColor.g, socioColor.b, 255 - blackFadeAlpha);

		draw.SimpleText("<:: Sociostatus = "..self.socioStatus.." ::>", "BudgetLabel", info.x, info.y, socioColor, TEXT_ALIGN_RIGHT);
		info.y = info.y + height;

		for k, v in ipairs(self.hudObjectives) do
			local textColor = Color(colorWhite.r, colorWhite.g, colorWhite.b, 255 - blackFadeAlpha);

			draw.SimpleText(v, "BudgetLabel", info.x, info.y, textColor, TEXT_ALIGN_RIGHT);

			info.y = info.y + height;
		end;
	end;
end;

-- Using to override schema functions. Hacky, I know, but there is no other way :(
-- A function to add a Combine display line.
function Schema:AddCombineDisplayLine(text, color)
	if (self:PlayerIsCombine(Clockwork.Client)) then
		if (not self.combineDisplayLines) then
			self.combineDisplayLines = {};
		end;

		if (color or not Clockwork.Client:GetCharacterData("IsBiosignalGone")) then
			table.insert(self.combineDisplayLines, {"<:: "..text.." ::>", CurTime() + 8, 5, color});
		end;

		if (color == nil) then
			cwCTO:UpdateBiosignalLocations();
		end;
	end;
end;

-- Called when an entity's target ID HUD should be painted.
function cwCTO:HUDPaintEntityTargetID(entity, info)
	local colorTargetID = Clockwork.option:GetColor("target_id");
	local colorWhite = Clockwork.option:GetColor("white");

	if (entity:GetClass() == "cw_ctocameraterminal") then
		info.y = Clockwork.kernel:DrawInfo("Camera Terminal", info.x, info.y, colorTargetID, info.alpha);
		info.y = Clockwork.kernel:DrawInfo("Used to view cameras.", info.x, info.y, colorWhite, info.alpha);
	end;
end;

-- Called when an entity's menu options are needed.
function cwCTO:GetEntityMenuOptions(entity, options)
	if (entity:GetClass() == "cw_ctocameraterminal") then
		options["Disable"] = "cwCameraOpen0";
		for k, v in pairs( ents.FindByClass("npc_combine_camera") ) do
			options["View C-i" .. v:EntIndex()] = "cwCameraOpen" .. v:EntIndex();
		end;
	end;
end;

-- Called whenever the HUD should be drawn.
function cwCTO:HUDPaint()
	for ent, bDraw in pairs(self.terminalsToDraw) do
		if (IsValid(ent) and bDraw) then
			local scrw, scrh = ScrW(), ScrH();

			local camera = ent:GetNWEntity("camera");

			if (IsValid(camera) and camera:GetClass() == "npc_combine_camera") then
				local bonePos, boneAngles = camera:GetBonePosition(camera:LookupBone("Combine_Camera.bone1"));
				local camPos, camAngles = camera:GetBonePosition(camera:LookupBone("Combine_Camera.Lens"));

				boneAngles.roll = boneAngles.roll + 90;

				local bulbColor = camera:GetChildren()[1]:GetColor();
				local statusText = "All Clear";
				local signalText = "[512x256/p15@TR42/036];#=i" .. camera:EntIndex() .. ";y=" .. math.floor(boneAngles.yaw) .. "&r=" .. math.floor(boneAngles.roll);
				if (bulbColor.g == 128) then
					statusText = "Watching...";
				elseif (bulbColor.g == 0) then
					statusText = "Violation!";
				end;

				render.PushRenderTarget(ent.tex);
					if (cwCTO:isCameraEnabled(camera)) then
						if (ent.lastCamOutputTime == nil or RealTime() - ent.lastCamOutputTime >= (1 / 15)) then
							render.RenderView({
								origin = camPos + (boneAngles:Forward() * 2.8),
								angles = boneAngles,
								fov = 90,
								aspectratio = 2,
								x = 0,
								y = 0,
								w = 512,
								h = 256
							});
							ent.lastCamOutputTime = RealTime();
						end;
					else
						render.Clear(0, 0, 0, 255, false, true);
						statusText = "Disabled";
						signalText = "no signal(?)";
						bulbColor = Color(255, 0, 0);
					end;
					cam.Start2D();
						draw.SimpleText("<:: C-i" .. camera:EntIndex() .. " ::>", "BudgetLabel", 4, 6);
						draw.SimpleText("<:: " .. statusText .. " ::>", "BudgetLabel", 4, 6 + draw.GetFontHeight("BudgetLabel"), bulbColor);
						draw.SimpleText(signalText, "BudgetLabel", 4, 252 - draw.GetFontHeight("BudgetLabel"));
						draw.SimpleText("*", "CloseCaption_Normal", 256, 126, bulbColor, 1, 1);
					cam.End2D();
				render.PopRenderTarget();

				ent.mat:SetTexture("$basetexture", ent.tex);
				ent:SetSubMaterial(1, "!" .. ent.mat:GetName());
			else
				ent:SetSubMaterial(1, "models/props_combine/combine_interface_disp");
			end;
		end;
	end;
end;
