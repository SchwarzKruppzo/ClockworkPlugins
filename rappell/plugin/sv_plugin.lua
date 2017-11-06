--[[
	Tru
--]]

local Clockwork = Clockwork;


function RappelFinish(e,playercolor,movetype,weaponcolor)
	local oldwepcolor = weaponcolor
	local oldcolor = playercolor
	if IsValid(e.Rappel) then 
		e:EmitSound("prappel/rappel_land2.wav")
		timer.Simple(1, function()
			if IsValid(e.Rappel) then 
				local ply = e.Rappel 
				e:EmitSound("prappel/clip_on.wav")
				if IsValid(ply.RappelEnt) then
					ply:SetPos(ply.RappelEnt:GetPos())
					ply:SetEyeAngles(Angle(0,ply.RappelEnt:GetAngles().yaw,0))
					e:Remove()
				end 
				ply:SetMoveType(movetype)
				if (ply:GetMoveType()!=MOVETYPE_WALK) then
					ply:SetMoveType(MOVETYPE_WALK)
				end
				-- Doing observer makes clockwork observer fuck up D;
				ply:SetWeaponColor(oldwepcolor)
				Clockwork.player:ToggleWeaponRaised(ply);
				cwObserverMode:MakePlayerExitObserverMode(ply);
				ply:UnSpectate()
 				ply:Freeze(false)
				ply:SetColor(oldcolor)
			else
				e:Remove()
			end
		end)
	end
end


function PlayerRappel(ply)
	local playerwepcolor = ply:GetWeaponColor() 
	local playercolor = ply:GetColor()
	local movetype = ply:GetMoveType()
	local po = ply:GetPos() + (ply:GetForward() * 30)
	local t = {}
	t.start = po
	t.endpos = po - Vector(0,0,1000)
	t.filter = {ply}
	local tr = util.TraceLine(t)
	if tr.HitPos.z <= ply:GetPos().z then
		local e = ents.Create("npc_metropolice")
		e:SetKeyValue("waitingtorappel",1) 
		e:SetPos(po)
		e:SetAngles(Angle(0,ply:EyeAngles().yaw,0))
		e:Spawn()
		e:CapabilitiesClear()
		e:CapabilitiesAdd( CAP_MOVE_GROUND  )
 		-- timer.Simple(10, function()  then RappelFinish(e,playercolor,movetype)  end end)
		timer.Create( "rappelchecker", 1, 0, function()
			if e:IsOnGround() then
				RappelFinish(e,playercolor,movetype,playerwepcolor)
				timer.Destroy("rappelchecker")
			end
		end)
		e.Rappel = ply
		e:EmitSound("prappel/rappel_loop.wav")
		e:SetModel(ply:GetModel())
		local plyweapon = ply:GetActiveWeapon():GetClass()
		if plyweapon == "cw_hands" then
			local plyweapon = "weapon_stunstick"
		end
		if plyweapon == "cw_keys" then
			local plyweapon = "weapon_stunstick"
		end
		e:Give(plyweapon)
		e:SetName("npc_gman")
		e.Gods = true
		e.God = true
		e:AddRelationship("player D_LI")
		ply:SetMoveType(MOVETYPE_FLY)
		ply:Freeze(true)
		--ply:SetNWEntity("sh_Eyes",e)
		--ply:SetViewEntity(e)
		ply:Spectate( OBS_MODE_CHASE )
		ply:SpectateEntity( e )
		Clockwork.player:ToggleWeaponRaised(ply);
		e:Fire("beginrappel")
		e:Fire("addoutput","OnRappelTouchdown rappelent,RunCode,0,-1", 0 )
		ply.RappelEnt = e
	end
end
