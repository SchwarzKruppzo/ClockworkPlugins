--[[ 
		Created by Polis, July 2014.
		Do not re-distribute as your own.


	 	Sort of messy, but /much/ better than it was before.  Believe me, god damn.
]]

/*----------------------\
| Edited by Viomi       | // Added " ::>" to the end of all visor messages
| viomi@openmailbox.org | // Removed all the god damn semi-colons
\----------------------*/

CreateClientConVar( "evo_names", 1, true, false )
CreateClientConVar( "evo_hud", 1, true, false )
CreateClientConVar( "evo_outlines", 1, true, false )
CreateClientConVar( "evo_crosshair", 1, true, false )
CreateClientConVar( "evo_outline_distance", 295, true, false )
CreateClientConVar( "evo_hud_distance", 300, true, false )

-- Get rid of them nasty display lines.
Schema.randomDisplayLines = {
	"Initialized VISOR" // What the fuck is a "VISR"
}

-- White Outlines Fixed
hook.Add("PreDrawHalos", "Outlines", function()
	if (Schema:PlayerIsCombine(LocalPlayer())) then
			halo.Add( player.GetAll(), Color(248,248,255,255), 0, 0, 1, true, false )
	end
end)

-- Colours
colormal = Color(255, 10, 0, 255)
coloryel = Color(255, 215, 0, 255)
colorgre = Color(50, 205, 50, 255)
color = Color(0, 128, 255, 255)
colorcitizen = Color(255, 250, 250, 255)

-- Fonts
surface.CreateFont( "HUDFont", {
	font = "BudgetLabel",
	size = 16,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "NameFont", {
	font = "BudgetLabel",
	size = 18,
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = true,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )



-- Crosshair
hook.Add("HUDPaint", "Crosshair", function()
	if (ConVarExists( "evo_crosshair" ) and GetConVar("evo_crosshair"):GetInt() == 1) then
		if (Schema:PlayerIsCombine(LocalPlayer())) then
	local x = ScrW() / 2
	local y = ScrH() / 2
	surface.SetDrawColor(0, 128, 255, 255)
	local gap = 5
	local length = gap + 15
	surface.DrawLine( x - length, y, x - gap, y )
	surface.DrawLine( x + length, y, x + gap, y )
	surface.DrawLine( x, y - length, x, y - gap )
	surface.DrawLine( x, y + length, x, y + gap )
			end
		end
	end)



-- Settings Derma
concommand.Add("evo_settings", function()
        local frame = vgui.Create("DFrame")
		local PropertySheet = vgui.Create( "DPropertySheet" )
		PropertySheet:SetParent( frame )
		PropertySheet:SetPos( 0, 25 )
		PropertySheet:SetSize( 600, 215 )
        frame:SetPos((surface.ScreenWidth()/2) - 350,(surface.ScreenHeight()/2) - 350)
        frame:SetSize(600, 245)
        frame:SetTitle("Enhanced Visual Overlay - Menu")
        frame:SetBackgroundBlur( true )
        frame:SetDraggable( true )
        frame:MakePopup()

		local SheetItemOne = vgui.Create( "DPanel" )
		SheetItemOne:SetPos( 25, 50 )
		SheetItemOne:SetSize( 350, 230 )
		SheetItemOne.Paint = function() -- 
		surface.SetDrawColor( 50, 50, 50, 255 ) -- 
		surface.DrawRect( 0, 0, SheetItemOne:GetWide(), SheetItemOne:GetTall() )
		end

		local NamesBox = vgui.Create( "DCheckBoxLabel", SheetItemOne )
		NamesBox:SetPos( 15, 15 )
		NamesBox:SetText( "Enable Friendly Names" )
		NamesBox:SetConVar( "evo_names" )
		NamesBox:SizeToContents()

		local HudBox = vgui.Create( "DCheckBoxLabel", SheetItemOne )
		HudBox:SetPos( 15, 30 )
		HudBox:SetText( "Enable the EVO HUD" )
		HudBox:SetConVar( "evo_hud" )
		HudBox:SizeToContents()	

		local OutBox = vgui.Create( "DCheckBoxLabel", SheetItemOne )
		OutBox:SetPos( 15,45 )
		OutBox:SetText( "Enable Detection" )
		OutBox:SetConVar( "evo_outlines" )
		OutBox:SizeToContents()

		local CrossBox = vgui.Create( "DCheckBoxLabel", SheetItemOne )
		CrossBox:SetPos( 15,60 )
		CrossBox:SetText( "Enable the Crosshair" )
		CrossBox:SetConVar( "evo_crosshair" )
		CrossBox:SizeToContents()

		local HUDDistanceMod = vgui.Create( "DNumSlider", SheetItemOne )
		HUDDistanceMod:SetPos( 15,90 )
		HUDDistanceMod:SetSize( 450, 50 )
		HUDDistanceMod:SetText( "HUD Distance Modifier" )
		HUDDistanceMod:SetMin( 260 )
		HUDDistanceMod:SetMax( 3000 )
		HUDDistanceMod:SetDecimals( 0 )
		HUDDistanceMod:SetConVar( "evo_hud_distance" )		

		local OutlineDistanceMOD = vgui.Create( "DNumSlider", SheetItemOne )
		OutlineDistanceMOD:SetPos( 15,105 )
		OutlineDistanceMOD:SetSize( 550, 50 )
		OutlineDistanceMOD:SetText( "Detection Distance Modifier" )
		OutlineDistanceMOD:SetMin( 5 )
		OutlineDistanceMOD:SetMax( 295 )
		OutlineDistanceMOD:SetDecimals( 0 )
		OutlineDistanceMOD:SetConVar( "evo_outline_distance" )														

		PropertySheet:AddSheet( "Settings", SheetItemOne, "icon16/wrench.png", false, false, "Configure the settings for your visual overlay." )        		
end)



-- General Interface
hook.Add("HUDPaint", "General Interface", function()
	if (Schema:PlayerIsCombine(LocalPlayer())) then
	for k,e in pairs ( player.GetAll() ) do
		if ( e:IsPlayer() and e != LocalPlayer() and !e:IsNoClipping() and e:GetPos():Distance(LocalPlayer():GetPos()) <= GetConVarNumber("evo_hud_distance")) then
		local Position = ( e:GetPos() + Vector( 0,0,80 ) ):ToScreen()
		local font = "HUDFont"

			if (ConVarExists( "evo_names" ) and GetConVar("evo_names"):GetInt() == 1 and Schema:PlayerIsCombine(e)) then
					draw.DrawText( e:Name(), "NameFont", Position.x, Position.y + 15, color, 1 )
			end

		if (ConVarExists( "evo_hud" ) and GetConVar("evo_hud"):GetInt() == 1) then	
			local model = e:GetModel()
			if (e:Health() <= 0) then
				draw.DrawText( "<:: !WARN: NO VITAL SIGNS ::>", font, Position.x, Position.y + 81, colormal, 1 )
			elseif (e:Health() <= 10) then
				draw.DrawText( "<:: !ATT: NEAR DEATH ::>", font, Position.x, Position.y + 31, colormal, 1 )
			elseif (e:Health() <= 96) then
				draw.DrawText( "<:: !NOTIF: INJURY DETECTED ::>", font, Position.x, Position.y + 31, coloryel, 1 )
			end

			if (e:IsRagdolled() and e:Alive()) then
				draw.DrawText( "<:: !NOTIF: UNCONSCIOUS ::>", font, Position.x, Position.y + 81, coloryel, 1 )
			elseif (e:GetSharedVar("tied") != 0 and !Schema:PlayerIsCombine(e)) then
				draw.DrawText( "<:: !NOTIF: RESTRAINED ::>", font, Position.x, Position.y + 44, colorgre, 1 )
			elseif (e:GetSharedVar("tied") != 0 and Schema:PlayerIsCombine(e)) then
				draw.DrawText( "<:: !ATT: RESTRAINED UNIT ::>", font, Position.x, Position.y + 44, coloryel, 1 )
			end

			if (e:FlashlightIsOn()) then
					draw.DrawText( "<:: !NOTIF: USING FLASHLIGHT ::>", font, Position.x, Position.y + 57, colorgre, 1 )
			end

				if (e:IsOnFire()) then
					draw.DrawText( "<:: !ATT: ON FIRE ::>", font, Position.x, Position.y + 57, colormal, 1 )
				elseif (e:InVehicle() and !Schema:PlayerIsCombine(e)) then
					draw.DrawText( "<:: !ATT: UNAUTHORIZED VEHICLE USAGE ::>", font, Position.x, Position.y + 57, colormal, 1 )
				elseif (e:IsRunning() or e:IsJogging()) then
					if (!Schema:PlayerIsCombine(e)) then
					draw.DrawText( "<:: !ATT: MOBILE VIOLATION ::>", font, Position.x, Position.y + 57, coloryel, 1 )
					end
				elseif (e:Crouching() and !Schema:PlayerIsCombine(e)) then
					draw.DrawText( "<:: !ATT: STEALTH ATTEMPT ::>", font, Position.x, Position.y + 57, coloryel, 1 )
				elseif (e:Crouching() and Schema:PlayerIsCombine(e)) then
					draw.DrawText( "<:: !NOTIF: IN-STEALTH ::>", font, Position.x, Position.y + 57, colorgre, 1 )
					end
			
			
				end
			end
		end	
	end
end)



hook.Add("HUDPaint", "Flying Words", function()
if (ConVarExists( "evo_outlines" ) and GetConVar( "evo_outlines" ):GetInt() == 1 and Schema:PlayerIsCombine(LocalPlayer())) then
	for k,ent in pairs (ents.FindByClass("cw_item")) do
		if LocalPlayer():Alive() and (Clockwork.entity:HasFetchedItemData(ent)) then
		local Table = ent:GetItemTable()
		local ita =  Table("category")	
		local Position = ( ent:GetPos() + Vector( 0,0,0 ) ):ToScreen()
		local distance = ent:GetPos():Distance(LocalPlayer():GetPos()) 
	if (ita == "Weapons") then
		if (ent:GetPos():Distance(LocalPlayer():GetPos()) <= GetConVarNumber("evo_outline_distance")) then
		draw.DrawText( "<:: !ATT: "..Table("name").." ::>", "HUDFont", Position.x, Position.y, Color(255, 0, 10, 255), 1 )
		draw.DrawText( "<:: Distance: " .. math.floor(distance), "HUDFont", Position.x, Position.y + 10, Color(255, 0, 10, 255), 1 )
		end
	elseif (ita == "Ammunition") then
		if (ent:GetPos():Distance(LocalPlayer():GetPos()) <= GetConVarNumber("evo_outline_distance")) then
		draw.DrawText( "<:: !POT: "..Table("name").." ::>", "HUDFont", Position.x, Position.y, Color(10, 80, 255, 255), 1 )
		draw.DrawText( "<:: Distance: " .. math.floor(distance), "HUDFont", Position.x, Position.y + 10, Color(10, 80, 255, 255), 1 )
		end
	elseif (ita == "Medical" and ita != "Weapons" and ita != "Ammunition") then
		if (ent:GetPos():Distance(LocalPlayer():GetPos()) <= GetConVarNumber("evo_outline_distance")) then
		draw.DrawText( "<:: "..Table("name").." ::>", "HUDFont", Position.x, Position.y, Color(0, 255, 10, 255), 1 )
		draw.DrawText( "<:: Distance: " .. math.floor(distance).." ::>", "HUDFont", Position.x, Position.y + 10, Color(0, 255, 10, 255), 1 )
		end
	end
				end
			end

		end	
end)

-- A function that modifies the Combine Display lines.
function Schema:AddCombineDisplayLine(text, color)
	if (self:PlayerIsCombine(Clockwork.Client)) then
		if (!self.combineDisplayLines) then
			self.combineDisplayLines = {}
		end
		
		table.insert(self.combineDisplayLines, {"!<:: "..text.." ::>", CurTime() + 90, 5, color})
	end
end