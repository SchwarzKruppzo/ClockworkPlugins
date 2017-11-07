--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local PLUGIN = PLUGIN;

local LEFT_SEPERATOR = Material("atomic/hud/hud_left.png");
local RIGHT_SEPERATOR = Material("atomic/hud/hud_right.png");
local MENU_TICK = Material("atomic/hud/hud_tick_mark.png");
local COMP_STRIP = Material("atomic/hud/hud_comp.png");
local ARMOR_EMPTY = Material("atomic/hud/armor_empty.png");
local ARMOR_FILL = Material("atomic/hud/armor_fill.png");
local ARMOR_BROKEN = Material("atomic/hud/armor_broken.png");
local CROSSHAIR = Material("atomic/hud/crosshair.png");
local CROSSHAIR_FILL = Material("atomic/hud/crosshair_filled.png");
local XP_BAR = Material("atomic/hud/xp_bar.png");
local XP_POINTER = Material("atomic/hud/xp_pointer.png");
local gradMat = Material("atomic/hud/line/fade_to_top.png");
local MAT_UP = Material("atomic/hud/arrow_up.png");
local MAT_DOWN = Material("atomic/hud/arrow_down.png");
local RADAR_TICK = Material("atomic/hud/vert_scrollbar.png");
local FLASHLIGHT = Material("atomic/hud/flashlight.png");

Clockwork.setting:AddCheckBox("HUD", "Show Fallout 3-themed HUD.", "cwFallout3HUD", "Whether or not to display the Fallout 3-styled HUD.");

Clockwork.option:SetKey("icon_str", "atomic/special/special_strength");
Clockwork.option:SetKey("icon_per", "atomic/special/special_perception");
Clockwork.option:SetKey("icon_end", "atomic/special/special_endurance");
Clockwork.option:SetKey("icon_chr", "atomic/special/special_charisma");
Clockwork.option:SetKey("icon_int", "atomic/special/special_intel");
Clockwork.option:SetKey("icon_agi", "atomic/special/special_agility");
Clockwork.option:SetKey("icon_luck", "atomic/special/special_luck");
Clockwork.option:SetKey("icon_default", "atomic/special/special_coffee");

Clockwork.option:SetKey("icon_frame", "atomic/vault-tec.png");

Clockwork.option:SetKey("icon_faction_default", "atomic/factions/default.png");

Clockwork.option:SetKey("icon_gender_male", "atomic/hud/male.png");
Clockwork.option:SetKey("icon_gender_female", "atomic/hud/female.png");

Clockwork.option:SetKey("icon_data_classes", {path = "", size = 32});
Clockwork.option:SetKey("icon_data_settings", {path = "atomic/hud/menuitems/settings.png", size = 32});
Clockwork.option:SetKey("icon_data_perks", {path = "atomic/hud/menuitems/perks.png", size = 32});
Clockwork.option:SetKey("icon_data_donations", {path = "", size = 32});
Clockwork.option:SetKey("icon_data_system", {path = "atomic/hud/menuitems/system.png", size = 32});
Clockwork.option:SetKey("icon_data_scoreboard", {path = "atomic/hud/menuitems/scoreboard.png", size = 32});
Clockwork.option:SetKey("icon_data_inventory", {path = "atomic/hud/menuitems/inventory.png", size = 32});
Clockwork.option:SetKey("icon_data_directory", {path = "atomic/hud/menuitems/directory.png", size = 32});
Clockwork.option:SetKey("icon_data_attributes", {path = "atomic/hud/menuitems/skills.png", size = 32});
Clockwork.option:SetKey("icon_data_special", {path = "atomic/hud/menuitems/special.png", size = 32});
Clockwork.option:SetKey("icon_data_business", {path = "", size = 32});

-- A function to draw the F03/NV styled HUD.
function Atomic:DrawFO3HUD(color, found, nextFind)
	local width = 385
	local height = 140;
	local x = ScrW() - width - 40;
	local y = ScrH() - height - 20;
	local tickWidth = 8;
	local tickHeight = 25;
	local tickX = x + 363;
	local tickY = y + 47;
	local tickColor = Color(color.r, color.g, color.b, 200);
	local skillDisplay = self.skillDisplay;
	local curTime = CurTime();
	local entity = Clockwork.Client:GetEyeTraceNoCursor().Entity;

	if (Clockwork.plugin:Call("CanDrawHUD", "XPBar")) then
		if (skillDisplay) then
			self:DrawXPBar(skillDisplay.name, Clockwork.attributes:Get(skillDisplay.name) or 1);
		end;
	end;

	if (Clockwork.plugin:Call("CanDrawHUD", "Sneak")) then
		if (Clockwork.Client:Crouching()) then
			draw.SimpleText("[SNEAK]", Clockwork.option:GetFont("hud_text_blur"), ScrW() / 2, 20, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER);
			draw.SimpleText("[SNEAK]", Clockwork.option:GetFont("hud_text"), ScrW() / 2, 20, color, TEXT_ALIGN_CENTER);
		end;
	end;

	if (Clockwork.plugin:Call("CanDrawHUD", "Crosshair")) then
		local info = {
			x = ScrW() / 2,
			y = ScrH() / 2
		};

		local crosshairMat = CROSSHAIR;

		if (self.crosshairFill) then
			crosshairMat = CROSSHAIR_FILL;
		end;

		Clockwork.plugin:Call("GetPlayerCrosshairInfo", info);

		surface.SetDrawColor(color);
		surface.SetMaterial(crosshairMat);
		surface.DrawTexturedRect(info.x - 32, info.y - 32, 64, 64);

		self.crosshairFill = false;
	end;

	if (Clockwork.plugin:Call("CanDrawHUD", "UseUI")) then
		local eyePos = Clockwork.Client:EyePos();

		if (entity and entity:IsValid() and entity:NearestPoint(eyePos):Distance(eyePos) <= 80) then
			local entityOptions = {};
			local canDraw = false;
			local useText = "Use";
			local useTable = {};
		
			Clockwork.plugin:Call("GetEntityMenuOptions", entity, entityOptions);

			--[[
				I don't know why checking the number of entries in the table doesn't work, but this dumb way works.
			--]]
			for k, v in pairs(entityOptions) do
				if (k or v) then
					canDraw = true;

					table.insert(useTable, k);
				end;
			end;

			local useNum = #useTable;

			if (useNum == 1) then
				useText = useTable[1];
			elseif (useNum > 1) then
				useText = "Use ["..tostring(useNum).."]";
			end;

			if (canDraw or entity:GetClass() == "cw_item") then
				local alpha = Clockwork.kernel:CalculateAlphaFromDistance(255, Clockwork.Client, entity);

				self.crosshairFill = true;

				Atomic:DrawUseUI(useText, color, alpha);
			end;
		end;
	end;

	local compX = 50;
	local compW = 312;
	local h = ScrH() - 50;

	if (Clockwork.plugin:Call("CanDrawHUD", "Compass")) then
		local compPart = -Clockwork.Client:GetAngles().y;

		if (compPart < 0) then
			compPart = (180 + compPart) + 180;
		end;				

		if (!nextFind or nextFind <= CurTime()) then
			found = self:GetRadarTable()

			nextFind = CurTime() + 1;
		end;

		-- Radar (EVS)
		render.SetScissorRect(compX + 7, h, compX + compW, h - 72, true);
			if (#found > 0) then
				for k, v in pairs(found) do
					if (v.ent:IsValid()) then
						local pos = v.ent:GetPos();
						local plyPos = LocalPlayer():GetPos();						
						local mark = (pos + Vector(0, 0, 16)):ToScreen();

						surface.SetDrawColor(0, 0, 0, 255);
						surface.SetMaterial(RADAR_TICK);
						surface.DrawTexturedRect(compX + mark.x * (compW / ScrW()) - 13, h - 34, 36, 22);

						surface.SetDrawColor(v.color);
						surface.SetMaterial(RADAR_TICK);
						surface.DrawTexturedRect(compX + mark.x * (compW / ScrW()) - 11, h - 32, 32, 18);

						if ((pos.z - plyPos.z) >= 60) then
							surface.SetMaterial(MAT_UP);
							surface.DrawTexturedRect(compX + mark.x * (compW / ScrW()) - 4, h - 32, 19, 17);
						elseif ((plyPos.z - pos.z) >= 60) then
							surface.SetMaterial(MAT_DOWN);
							surface.DrawTexturedRect(compX + mark.x * (compW / ScrW()) - 4, h - 32, 19, 17);
						end;
					end;
				end;
			end;
		render.SetScissorRect(0, 0, 0, 0, false);

		surface.SetDrawColor(color);
		surface.SetMaterial(COMP_STRIP);
		surface.DrawPartialTexturedRect(compX, ScrH() - 90, compW, 64, (1024 / 360) * compPart, 0, compW, 64, 1336, 64);
	end;

	if (Clockwork.plugin:Call("CanDrawHUD", "RightFrame")) then
		local stamina = Clockwork.Client:GetSharedVar("Stamina");
		local progress = math.ceil((38 * 0.01) * stamina);
		local weapon = Clockwork.Client:GetActiveWeapon();
				
		if (weapon and IsValid(weapon)) then
			local itemTable = Clockwork.item:GetByWeapon(weapon);

			if (weapon.Clip1) then
				local clipOne = weapon:Clip1();

				if (clipOne >= 0) then
					local ammoString = (clipOne.."/"..Clockwork.Client:GetAmmoCount(weapon:GetPrimaryAmmoType()))

					draw.SimpleText(ammoString, Clockwork.option:GetFont("hud_text_blur"), x + width - 30, tickY + 25, Color(0, 0, 0, 255), TEXT_ALIGN_RIGHT);
					draw.SimpleText(ammoString, Clockwork.option:GetFont("hud_text"), x + width - 30, tickY + 25, color, TEXT_ALIGN_RIGHT);
				end;
			end;

			if (itemTable) then
				local health = itemTable.health or 200
				local dura = (itemTable:GetData("Condition") / health) * 100;

				if (dura) then
					local barColor = Color(math.max(color.r - 70, 0), math.max(color.g - 70, 0), math.max(color.b - 70, 0), color.a);

					draw.SimpleText("CND", Clockwork.option:GetFont("hud_text_blur"), x + 120, tickY + 25, Color(0, 0, 0, 255), TEXT_ALIGN_RIGHT);
					draw.SimpleText("CND", Clockwork.option:GetFont("hud_text"), x + 120, tickY + 25, color, TEXT_ALIGN_RIGHT);
								
					surface.SetDrawColor(barColor);
					surface.DrawRect(x + 125, tickY + 34, 58, 19);

					local duraProg = math.ceil((58 * 0.01) * dura);
								
					surface.SetDrawColor(color);
					surface.DrawRect(x + 125, tickY + 34, duraProg, 19);						
				end;
			end;
		end;

		draw.SimpleText("STAM", Clockwork.option:GetFont("hud_text_blur"), x + width - 30, tickY - 40, Color(0, 0, 0, 255), TEXT_ALIGN_RIGHT);
		draw.SimpleText("STAM", Clockwork.option:GetFont("hud_text"), x + width - 30, tickY - 40, color, TEXT_ALIGN_RIGHT);
					
		for i = 1, 38 do
			if (progress != 0 and progress >= i) then
				local newTickX = tickX - ((i - 1) * tickWidth);

				if (i == 1) then
					newTickX = tickX;
				end;

				surface.SetDrawColor(tickColor);
				surface.SetMaterial(MENU_TICK);
				surface.DrawTexturedRect(newTickX, tickY, tickWidth, tickHeight);
			end;
		end;
	
		surface.SetDrawColor(color);
		surface.SetMaterial(RIGHT_SEPERATOR);
		surface.DrawTexturedRect(x, y, width, height);
	end;

	if (Clockwork.plugin:Call("CanDrawHUD", "LeftFrame")) then
		local healProgress = math.ceil((38 / Clockwork.Client:GetMaxHealth()) * Clockwork.Client:Health());

		draw.SimpleText("HP", Clockwork.option:GetFont("hud_text_blur"), 65, tickY - 40, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT);
		draw.SimpleText("HP", Clockwork.option:GetFont("hud_text"), 65, tickY - 40, color, TEXT_ALIGN_LEFT);
					
		for i = 1, 38 do
			if (healProgress != 0 and healProgress >= i) then
				local newTickX = 57 + ((i - 1) * tickWidth);

				if (i == 1) then
					newTickX = 57;
				end;

				surface.SetDrawColor(tickColor);
				surface.SetMaterial(MENU_TICK);
				surface.DrawTexturedRect(newTickX, tickY, tickWidth, tickHeight);
			end;
		end;

		surface.SetDrawColor(color);
		surface.SetMaterial(LEFT_SEPERATOR);
		surface.DrawTexturedRect(38, y, width + 2, height);

		local armor = Clockwork.Client:Armor();
		local itemTable = Clockwork.player:GetClothesItem();

		if (armor > 0) then
			local armorPercent = armor / Clockwork.Client:GetMaxArmor();

			surface.SetMaterial(ARMOR_FILL);
			surface.DrawPartialTexturedRect(30 + width, (tickY - 32) + (32 - (32 * armorPercent)), 32, 32, 0, 32 - (32 * armorPercent), 32, 32, 32, 32);

			surface.SetMaterial(ARMOR_EMPTY);
			surface.DrawTexturedRect(30 + width, tickY - 32, 32, 32);
		elseif (itemTable) then
			local itemArmor = itemTable:GetData("Armor");

			if (armor == itemArmor) then
				surface.SetDrawColor(Color(255, 0, 0, 255));
				surface.SetMaterial(ARMOR_BROKEN);
				surface.DrawTexturedRect(30 + width, tickY - 32, 32, 32);
			end;
		end;
	end;
end;

function PLUGIN:DrawInfoUI(title, nameLeft, valueLeft, nameRight, valueRight, alpha)
	if (!alpha) then alpha = 255; end;

	local color = Clockwork.option:GetColor("information");
	local colorBlack = Color(0, 0, 0, alpha);

	if (CW_CONVAR_FOHUD:GetInt() == 1 and CW_CONVAR_PRIMARYHUD:GetInt() == 0) then
		local y = ScrH() - 160;

		if (title) then
			draw.SimpleText(title, Clockwork.option:GetFont("hud_text_blur"), ScrW() / 2, y, colorBlack, TEXT_ALIGN_CENTER);
			draw.SimpleText(title, Clockwork.option:GetFont("hud_text"), ScrW() / 2, y, color, TEXT_ALIGN_CENTER);
		end;

		if (valueLeft or nameLeft or valueLeft or nameRight) then
			surface.SetDrawColor(color);
			surface.SetMaterial(HUD_BOTTOM);
			surface.DrawTexturedRect(ScrW() / 2 - 160, y + 30, 320, 70);
		end;
			
		if (valueLeft) then
			draw.SimpleText(valueLeft, Clockwork.option:GetFont("hud_text_blur"), ScrW() / 2 - 15, y + 50, colorBlack, TEXT_ALIGN_RIGHT);
			draw.SimpleText(valueLeft, Clockwork.option:GetFont("hud_text"), ScrW() / 2 - 15, y + 50, color, TEXT_ALIGN_RIGHT);
		end;

		if (nameLeft) then
			draw.SimpleText(nameLeft, Clockwork.option:GetFont("hud_text_blur"), ScrW() / 2 - 140, y + 50, colorBlack, TEXT_ALIGN_LEFT);
			draw.SimpleText(nameLeft, Clockwork.option:GetFont("hud_text"), ScrW() / 2 - 140, y + 50, color, TEXT_ALIGN_LEFT);
		end;			

		if (valueLeft) then
			draw.SimpleText(valueRight, Clockwork.option:GetFont("hud_text_blur"), ScrW() / 2 + 140, y + 50, colorBlack, TEXT_ALIGN_RIGHT);
			draw.SimpleText(valueRight, Clockwork.option:GetFont("hud_text"), ScrW() / 2 + 140, y + 50, color, TEXT_ALIGN_RIGHT);	
		end;

		if (nameRight) then
			draw.SimpleText(nameRight, Clockwork.option:GetFont("hud_text_blur"), ScrW() / 2 + 10, y + 50, colorBlack, TEXT_ALIGN_LEFT);
			draw.SimpleText(nameRight, Clockwork.option:GetFont("hud_text"), ScrW() / 2 + 10, y + 50, color, TEXT_ALIGN_LEFT);
		end;

		self.crosshairFill = true;
	end;
end;

function PLUGIN:DrawUseUI(useText, color, alpha)
	if (!alpha) then alpha = 255; end;

	if (CW_CONVAR_FOHUD:GetInt() == 1 and CW_CONVAR_PRIMARYHUD:GetInt() == 0) then
		local y = ScrH() - 160;

		draw.SimpleText("E) "..useText, Clockwork.option:GetFont("hud_text_blur"), ScrW() / 2, y - 35, Color(0, 0, 0, alpha), TEXT_ALIGN_CENTER);
		draw.SimpleText("E) "..useText, Clockwork.option:GetFont("hud_text"), ScrW() / 2, y - 35, Color(color.r, color.g, color.b, alpha), TEXT_ALIGN_CENTER);
	end;
end;

function PLUGIN:Initialize()
	CW_CONVAR_FOHUD = Clockwork.kernel:CreateClientConVar("cwFallout3HUD", 1, true, true);

	if (CW_CONVAR_FOHUD:GetInt() == 1) then
		Clockwork.chatBox:SetCustomPosition(50, ScrH() - 200);
	end;
end;

-- Called when a ConVar has changed.
function PLUGIN:ClockworkConVarChanged()
	if (CW_CONVAR_FOHUD:GetInt() == 1) then
		Clockwork.chatBox:SetCustomPosition(50, ScrH() - 200);
	end;
end;

-- Called when the HUD is painted.
function PLUGIN:HUDPaint()
	if (!Clockwork.kernel:IsChoosingCharacter() and Clockwork.Client:Health() > 0 and !Clockwork.Client:IsRagdolled()) then
		local infoColor = Clockwork.option:GetColor("information");
		local found = {};
		local nextFind = nil;

		if (CW_CONVAR_FOHUD:GetInt() == 1 and CW_CONVAR_PRIMARYHUD:GetInt() == 0) then
			Atomic:DrawFO3HUD(infoColor, found, nextFind);
		elseif (CW_CONVAR_PRIMARYHUD:GetInt() == 1) then
			if (Clockwork.Client:FlashlightIsOn()) then
				local flashX = ScrW() - 165;
				local flashY = ScrH() - 470;
				local colorDarker = Color(
					math.max(infoColor.r - 200, 0),
					math.max(infoColor.g - 200, 0),
					math.max(infoColor.b - 200, 0),
					150
				);

				draw.RoundedBox(2, flashX, flashY, 65, 65, colorDarker);
				surface.SetDrawColor(Color(0, 0, 0, 255));
				surface.SetMaterial(FLASHLIGHT);
				surface.DrawTexturedRect(flashX + 2, flashY + 2, 65, 65);
				surface.SetDrawColor(infoColor);
				surface.SetMaterial(FLASHLIGHT);
				surface.DrawTexturedRect(flashX, flashY, 65, 65);
			end;
		end;
	end;
end;

local positions = {
	25,
	51,
	76,
	101,
	126,
	152,
	176,
	203,
	228
};

function Atomic:DrawXPBar(name, newValue)
	local oldValue = newValue - 1;
	local infoColor = Clockwork.option:GetColor("information");
	local color = Color(infoColor.r, infoColor.g, infoColor.b, self.skillAlpha);
	local colorBlack = Color(0, 0, 0, self.skillAlpha);
	local frameTime = FrameTime();
	local nextTen = math.ceil(newValue / 10) * 10;
	local lastTen = math.floor(newValue / 10) * 10;
	local w = 385;
	local h = 140;
		
	if (oldValue - lastTen <= 0) then
		if (lastTen / 10 >= 1 and newValue - lastTen != 1) then
			self.tick = self.tick or 228;
		else
			self.tick = self.tick or 0;
		end;
	else
		self.tick = self.tick or (positions[oldValue - lastTen] or 0);
	end;

	if (lastTen == nextTen) then
		nextTen = lastTen + 10;
	end;

	if (!self.SkillFadeIn) then
		surface.PlaySound("atomic/skill_up.wav");

		self.SkillFadeIn = CurTime() + 7;

		if (!self.skillAlpha) then
			self.skillAlpha = 0;
		end;
	end;

	if (self.fadeOut == true) then
		self.skillAlpha = math.Clamp(self.skillAlpha - (100 * FrameTime()), 0, 255);
	end;

	if (self.skillAlpha < 255) then
		if (!self.fadeOut) then
			self.skillAlpha = math.Clamp(self.skillAlpha + (100 * FrameTime()), 0, 255);
		end;
	elseif (self.skillAlpha == 255) then
		if (!self.SkillFadeOut) then
			self.SkillFadeOut = CurTime() + 1;
		end;

		if (CurTime() >= self.SkillFadeOut) then
			self.fadeOut = true;	
		end;
	end;

	if (self.SkillFadeOut) then
		if (newValue - lastTen <= 0) then
			self.tick = math.Clamp(self.tick - (150 * FrameTime()), 0, self.tick);
		else
			self.tick = math.Clamp(self.tick + (15 * FrameTime()), self.tick, positions[newValue - lastTen]);
		end;
	end;

	local pointerAlpha = self.skillAlpha;
	local tickPosition = ScrW() - w + 58 + self.tick;

	if (newValue - lastTen <= 0 and !self.SkillFadeOut) then
		nextTen = nextTen - 10;
		lastTen = lastTen - 10;
	end;

	surface.SetDrawColor(color.r, color.g, color.b, self.skillAlpha);
	surface.SetMaterial(XP_BAR);
	surface.DrawTexturedRect(ScrW() - w, ScrH() * 0.65, w, h);

	surface.SetDrawColor(color.r, color.g, color.b, pointerAlpha);
	surface.SetMaterial(XP_POINTER);
	surface.DrawTexturedRect(tickPosition, ScrH() * 0.65 + 10, 42, 42)

	surface.SetFont(Clockwork.option:GetFont("hud_text"));
	local nX, nY = surface.GetTextSize(name);

	surface.SetFont(Clockwork.option:GetFont("hud_text_big"));
	local n2X, n2Y = surface.GetTextSize("+"..newValue);

	local valuePos = ScrW() - nX - (n2X / 2) - 15;

	if (newValue >= 10) then
		valuePos = valuePos + 15;
	end;

	draw.DrawText("+"..newValue, Clockwork.option:GetFont("hud_text_big_blur"), valuePos, ScrH() * 0.65 + 70, colorBlack, TEXT_ALIGN_RIGHT);
	draw.DrawText("+"..newValue, Clockwork.option:GetFont("hud_text_big"), valuePos, ScrH() * 0.65 + 70, color, TEXT_ALIGN_RIGHT);
	draw.DrawText(name, Clockwork.option:GetFont("hud_text_blur"), ScrW() - 30, ScrH() * 0.65 + 75, colorBlack, TEXT_ALIGN_RIGHT);
	draw.DrawText(name, Clockwork.option:GetFont("hud_text"), ScrW() - 30, ScrH() * 0.65 + 75, color, TEXT_ALIGN_RIGHT);
	draw.DrawText(nextTen - 1, Clockwork.option:GetFont("hud_text_blur"), ScrW() - 55, ScrH() * 0.65 + 25, colorBlack, TEXT_ALIGN_CENTER);
	draw.DrawText(nextTen - 1, Clockwork.option:GetFont("hud_text"), ScrW() - 55, ScrH() * 0.65 + 25, color, TEXT_ALIGN_CENTER);
	draw.DrawText(lastTen, Clockwork.option:GetFont("hud_text_blur"), ScrW() - 325, ScrH() * 0.65 + 25, colorBlack, TEXT_ALIGN_CENTER);
	draw.DrawText(lastTen, Clockwork.option:GetFont("hud_text"), ScrW() - 325, ScrH() * 0.65 + 25, color, TEXT_ALIGN_CENTER);
		
	if (self.SkillFadeIn <= CurTime()) then
		self.skillDisplay = nil;
		self.SkillFadeIn = nil;
		self.skillAlpha = nil;
		self.fadeOut = nil;
		self.tick = nil;
		self.SkillFadeOut = nil;
	end;
end;