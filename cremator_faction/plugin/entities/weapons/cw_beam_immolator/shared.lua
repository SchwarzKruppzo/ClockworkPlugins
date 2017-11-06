if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
	
end

if CLIENT then

SWEP.PrintName = "Immolator [Beam]"
SWEP.Slot = 5
SWEP.Author	= "BattlePope"
SWEP.SlotPos = 6
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.ViewModelFOV = 58
SWEP.ViewModelFlip = false

end

-- Code by CrazyBubba64
-- Modifications by BattlePope
-- Plugin Fix by karl-police
------------------------------ Only admin can spawn / everyone can spawn -------------------
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
-----------------------------------------------------------------------------------------------------------
SWEP.HoldType			= "normal"
-----------------------------------------------------------------------------------------------------------
game.AddAmmoType( { name = "bp_immolator" } )
if ( CLIENT ) then language.Add( "bp_immolator_ammo", "Plasma" ) end

SWEP.Primary.NeverRaised = true;
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= 1000
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "bp_immolator"
SWEP.Primary.Damage		= 1
SWEP.Primary.Recoil		= 0
SWEP.Secondary.Ammo		= "none"

SWEP.LoweredAngles = Angle(0, 0, 0);
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------About model----------------------------------------------------------------
SWEP.ViewModel			= "models/weapons/v_cremato2.mdl"
SWEP.WorldModel			= "models/Weapons/shell.mdl"
---------------------------------------------------------------------------------------------------------------------------------

SWEP.Sound = Sound ("weapons/1immolator/plasma_shoot.wav")

SWEP.Volume = 7
SWEP.Influence = 0

SWEP.LastSoundRelease = 0
SWEP.RestartDelay = 0
SWEP.RandomEffectsDelay = 0.2

function SWEP:Initialize()
		self:SetWeaponHoldType(self.HoldType)
	end
function SWEP:Precache()
end

function SWEP:PrimaryAttack()
	if self:IsUnderWater() then return end
	if (!SERVER) then return end
	if ( self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 ) then

    local tr, vm, muzzle, attach//, effectdata
    
    
    
    tr = { }
    
    tr.start = self.Owner:GetShootPos( )
    tr.filter = self.Owner
    tr.endpos = tr.start + self.Owner:GetAimVector( ) * 4096
    tr.mins = Vector( ) * -2
    tr.maxs = Vector( ) * 2
    
    tr = util.TraceHull( tr )
	
	local tr, vm, muzzle, attach//, effectdata
	vm = self.Owner:GetViewModel()
	local trace = self.Owner:GetEyeTrace()
	local hit = trace.HitPos
	attach = vm:LookupAttachment("muzzle")
	vstr = tostring(self.Weapon)
	local MuzzlePos = self.Owner:GetShootPos() + (self.Owner:GetRight() * 6) + (self.Owner:GetUp() * -9) + (self.Owner:GetForward() * 30)
	self:lase(vstr, attach, MuzzlePos, hit, 1)
	self:lase(vstr, attach, MuzzlePos, hit, 0)
	self.Owner:ViewPunch( Angle( math.random(-.01, .01), math.random(-.01, .01), math.random(-.01, .01) ) )
	self:TakePrimaryAmmo( 0 )
	self:ShootEffects()
 
 else
 self:EndSound()
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
end

function SWEP:Think()
	if SERVER then

		self.LastFrame = self.LastFrame or CurTime()
		self.LastRandomEffects = self.LastRandomEffects or 0		
		if self.Owner:KeyDown (IN_ATTACK) and self.LastSoundRelease + self.RestartDelay < CurTime() then
			if not self.SoundObject then
				self:CreateSound()

			end
			self.SoundObject:PlayEx(5, 100)
			
			self.Volume = math.Clamp (self.Volume + CurTime() - self.LastFrame, 0, 2)
			self.Influence = math.Clamp (self.Influence + (CurTime() - self.LastFrame) / 2, 0, 1)
			
			self.SoundPlaying = true
		else
		
			if self.SoundObject and self.SoundPlaying then

				self.SoundObject:FadeOut (0.8)			
				self.SoundPlaying = false
				self.LastSoundRelease = CurTime()
				self.Volume = 0
				self.Influence = 0
				self:Idle()	
			end
		end
		if not self.Owner:Alive() then
		self:EndSound()
		end
		self.LastFrame = CurTime()
		self.Weapon:SetNWBool ("on", self.SoundPlaying)
			end
		end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW);
	self:SetNextPrimaryFire( CurTime() + self:SequenceDuration())
	self:SetNextSecondaryFire( CurTime() + self:SequenceDuration())
	self:NextThink( CurTime() + self:SequenceDuration() )
	self:Idle()
   return true
end

function SWEP:ShootEffects()
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	self.Owner:MuzzleFlash()								
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
end

function SWEP:IsUnderWater()
	if self:WaterLevel() < 3 then
		return false
	else
		if SERVER then
			--local pos = self:GetPos()+Vector(0,0,50)
			local pos = (self.Owner:GetShootPos() + self.Owner:GetAimVector()*40)-Vector(0,0,25)
			tes = ents.Create( "point_tesla" )
			tes:SetPos( pos )
			tes:SetKeyValue( "m_SoundName", "DoSpark" )
			tes:SetKeyValue( "texture", "sprites/laserbeam.spr" )
			tes:SetKeyValue( "m_Color", "255 180 180" )
			tes:SetKeyValue("rendercolor", "255 180 180")
			tes:SetKeyValue( "m_flRadius", "100" )
			tes:SetKeyValue( "beamcount_max", "10" )
			tes:SetKeyValue( "thick_min", "5" )
			tes:SetKeyValue( "thick_max", "10" )
			tes:SetKeyValue( "lifetime_min", "0.1" )
			tes:SetKeyValue( "lifetime_max", "0.3" )
			tes:SetKeyValue( "interval_min", "0.1" )
			tes:SetKeyValue( "interval_max", "0.2" )
			tes:Spawn()
			tes:Fire( "DoSpark", "", 0 )
			tes:Fire( "DoSpark", "", 0.1 )
			tes:Fire( "DoSpark", "", 0.2 )
			tes:Fire( "DoSpark", "", 0.3 )
			tes:Fire( "kill", "", 0.3 )
			local hitdie = ents.Create("point_hurt"); --This is what kills stuff
			hitdie:SetKeyValue("Damage",100)
			hitdie:SetKeyValue("DamageRadius",100)
			hitdie:SetKeyValue("DamageType","SHOCK")
			hitdie:SetParent( self.Owner )
			hitdie:SetPos( pos )
			hitdie:Spawn();
			hitdie:Fire("hurt","",0.1); -- ACTIVATE THE POINT_HURT
			hitdie:Fire("kill","",1.2);
		end
		self:EmitSound("ambient/energy/weld"..math.random(1,2)..".wav")
		self:EmitSound("weapons/gauss/electro"..math.random(1,3)..".wav")
		self:SetNextPrimaryFire(CurTime()+0.8)
		self:SetNextSecondaryFire(CurTime()+0.8)
		return true
	end
end

function SWEP:lase(par, stat, from, to, noise)
	if SERVER then
	 
	entItem = ents.Create ("info_target")
	realName = "entItem"..tostring(self.Owner:GetName())
		entItem:SetKeyValue("targetname", realName)
	entItem:Spawn()
	beam = ents.Create("env_laser")
		beam:SetKeyValue("renderamt", "255")
		beam:SetKeyValue("rendercolor", "0 255 0")
		beam:SetKeyValue("texture", "sprites/laserbeam.spr")
		beam:SetKeyValue("TextureScroll", "14")
		beam:SetKeyValue("targetname", "beam" )
		beam:SetKeyValue("renderfx", "2")
		beam:SetKeyValue("width", "1")
		beam:SetKeyValue("dissolvetype", "-1")
		beam:SetKeyValue("EndSprite", "")
		beam:SetKeyValue("LaserTarget", realName)//"entItem")
		beam:SetKeyValue("TouchType", "2")
		beam:SetKeyValue("NoiseAmplitude", noise)
	beam:Spawn()
	tent = ents.Create("point_tesla")
	tent:SetKeyValue("texture","sprites/laserbeam.spr")
	tent:SetKeyValue("m_Color","0 255 0 255")
	tent:SetKeyValue("m_flRadius","150")
	tent:SetKeyValue("beamcount_min","20")
	tent:SetKeyValue("beamcount_max","50")
	tent:SetKeyValue("lifetime_min","0.05")
	tent:SetKeyValue("lifetime_max","0.06")
	tent:SetKeyValue("interval_min","0.1")
	tent:SetKeyValue("interval_max","0.35")
	tent:SetPos(to)
	tent:Spawn()
	tent:Activate()
	tent:Fire("TurnOn","",0)
	aoe = ents.Create("env_beam")
		aoe:SetKeyValue("renderamt", "255")
		aoe:SetKeyValue("rendercolor", "0 255 0")
		aoe:SetKeyValue("life", "0")
		aoe:SetKeyValue("radius", "32")
		aoe:SetKeyValue("LightningStart", "entItem")
		aoe:SetKeyValue("StrikeTime", "0.05")
		aoe:SetKeyValue("damage", "12")
		aoe:SetKeyValue("NoiseAmplitude", "7")
		aoe:SetKeyValue("texture", "sprites/laserbeam.spr")
		aoe:SetKeyValue("dissolvetype", "2")
	aoe:Fire("TurnOn", "", 0.01)
	aoe:SetPos(to)
	aoe:Fire("kill", "", 0.11)
	beam:Fire("TurnOn", "", 0.01)
	beam:Fire("kill", "", 0.11)
	entItem:Fire("kill", "", 0.11)
	tent:Fire("Kill","",0.11)
	entItem:SetPos(to)
	beam:SetPos(from)
	end
end

function SWEP:CreateSound ()
	self.SoundObject = CreateSound (self.Weapon, self.Sound)
	self.SoundObject:Play()
end

function SWEP:Holster() self:EndSound() return true end
function SWEP:OwnerChanged() self:EndSound() end

function SWEP:EndSound ()
	if self.SoundObject then
		self.SoundObject:Stop()
	end
end

function SWEP:OnRemove()
	self:EndSound()
	return true
end

function SWEP:Holster( weapon )
	if ( CLIENT ) then return end
	
	self:StopIdle()
	
	return true
end

function SWEP:DoIdleAnimation()
	self:SendWeaponAnim( ACT_VM_IDLE )
end

function SWEP:DoIdle()
	self:DoIdleAnimation()

	timer.Adjust( "weapon_idle" .. self:EntIndex(), self:SequenceDuration(), 0, function()
		if ( !IsValid( self ) ) then timer.Destroy( "weapon_idle" .. self:EntIndex() ) return end

		self:DoIdleAnimation()
	end )
end

function SWEP:StopIdle()
	timer.Destroy( "weapon_idle" .. self:EntIndex() )
end

function SWEP:Idle()
	if ( CLIENT || !IsValid( self.Owner ) ) then return end
	timer.Create( "weapon_idle" .. self:EntIndex(), self:SequenceDuration() - 0.2, 1, function()
		if ( !IsValid( self ) ) then return end
		self:DoIdle()
	end )
end