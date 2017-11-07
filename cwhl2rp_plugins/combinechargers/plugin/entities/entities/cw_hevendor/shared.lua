AddCSLuaFile()

DEFINE_BASECLASS("base_gmodentity");

ENT.Type = "anim"
ENT.PrintName = "Health Charger"
ENT.Author = "Soviet"
ENT.Category = "HL2 RP"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.PhysgunDisable = true
ENT.PhysgunAllowAdmin = true

function ENT:SpawnFunction(client, trace)
	local entity = ents.Create("cw_hevendor")
	entity:SetPos(trace.HitPos + Vector(0, 0, 0))

	local angles = (entity:GetPos() - client:GetPos()):Angle()
	angles.p = 0
	angles.y = 0
	angles.r = 0

	entity:SetAngles(angles)
	entity:Spawn()
	entity:Activate()

	for k, v in pairs(ents.FindInBox(entity:LocalToWorld(entity:OBBMins()), entity:LocalToWorld(entity:OBBMaxs()))) do
		if (string.find(v:GetClass(), "prop") and v:GetModel() == "models/props_combine/health_charger001.mdl") then
			entity:SetPos(v:GetPos())
			entity:SetAngles(v:GetAngles())
			SafeRemoveEntity(v)

			break
		end
	end

	return entity
end

function ENT:Initialize()
 
	self:SetModel( "models/props_combine/health_charger001.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS )
 
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end
 

function ENT:Use( activator, caller )
    if (!self.nextUse or CurTime() >= self.nextUse) then
		if (Schema:PlayerIsCombine(activator)) then
			if (activator:Health() < activator:GetMaxHealth()) then
				self.nextUse = CurTime() + 10;
				activator:EmitSound("items/medshot4.wav", 55, 100)
				activator:SetHealth( activator:GetMaxHealth() );
			else
				self.nextUse = CurTime() + 2;	
				activator:EmitSound("items/medshotno1.wav", 55, 100)
			end;
		else
			self.nextUse = CurTime() + 2;
			activator:EmitSound("items/medshotno1.wav", 55, 100)
			Clockwork.player:Notify(activator, "The charger beeps harshly.")
		end;
	else
		return
	end
end