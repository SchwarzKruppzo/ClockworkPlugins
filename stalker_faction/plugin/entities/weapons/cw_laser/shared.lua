
if (SERVER) then

	AddCSLuaFile("shared.lua");
	
	
end;

if (CLIENT) then
	SWEP.Slot = 0;
	SWEP.SlotPos = 5;
	SWEP.DrawAmmo = false;
	SWEP.PrintName = "Laser beam";
	SWEP.DrawCrosshair = true;
	
	game.AddParticles("particles/Weapon_FX.pcf");
end

PrecacheParticleSystem("Weapon_Combine_Ion_Cannon_Beam");
PrecacheParticleSystem("Weapon_Combine_Ion_Cannon");
PrecacheParticleSystem("Weapon_Combine_Ion_Cannon_Backup");

SWEP.Instructions = "Primary Fire: Fire your laser beam.";
SWEP.Purpose = "For death.";
SWEP.Contact = "";
SWEP.Author	= "karl-police";

SWEP.WorldModel = "models/weapons/w_fists_t.mdl";
SWEP.ViewModel = "models/weapons/v_punch.mdl";
SWEP.HoldType = "fist";

SWEP.AdminSpawnable = false;
SWEP.Spawnable = false;
  
SWEP.Primary.NeverRaised = true;
SWEP.Primary.DefaultClip = 0;
SWEP.Primary.Automatic = false;
SWEP.Primary.ClipSize = -1;
SWEP.Primary.Damage = 90;
SWEP.Primary.Delay = 3;
SWEP.Primary.Ammo = "";

SWEP.Secondary.DefaultClip = 0;
SWEP.Secondary.Automatic = false;
SWEP.Secondary.ClipSize = -1;
SWEP.Secondary.Delay = 0;
SWEP.Secondary.Ammo	= "";

SWEP.NoIronSightFovChange = true;
SWEP.NoIronSightAttack = true;
SWEP.LoweredAngles = Angle(60, 60, 60);
SWEP.IronSightPos = Vector(0, 0, 0);
SWEP.IronSightAng = Vector(0, 0, 0);
SWEP.NeverRaised = true;

-- Called when the SWEP is deployed.
function SWEP:Deploy()
	self:SendWeaponAnim(ACT_VM_DRAW);
end;

-- Called when the SWEP is holstered.
function SWEP:Holster(switchingTo)
	self:SendWeaponAnim(ACT_VM_HOLSTER);
	
	return true;
end;

-- Called when the SWEP is initialized.
function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType);
end;

-- Called when the player attempts to primary fire.
function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay);
	
	if (self.Owner:OnGround()) then
		if (SERVER) then
			self.Owner:SetForcedAnimation("jumpback", 1.5);
		end;
		
		local chargeSound = CreateSound(self.Owner, "npc/beams/beamstart5");
		chargeSound:Play();
		
		ParticleEffectAttach("Weapon_Combine_Ion_Cannon_Backup", PATTACH_POINT_FOLLOW, self.Owner, self.Owner:LookupAttachment("eyes"));
		
		timer.Simple(1.5, function()
			chargeSound:Stop();
			self.Owner:EmitSound("npc/beams/beamstart5");
			
			local tr = util.QuickTrace(self.Owner:EyePos(), self.Owner:EyeAngles():Forward()*5000, self.Owner);
			
			self.Owner:StopParticles();
			util.ParticleTracerEx("Weapon_Combine_Ion_Cannon_Beam", self.Owner:GetAttachment(self.Owner:LookupAttachment("eyes")).Pos,tr.HitPos, true, self.Owner:EntIndex(), self.Owner:LookupAttachment("eyes"));
			
			util.BlastDamage(self.Owner, self.Owner, tr.HitPos, 10, 400);
		end);
	end;
end;