
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;


local WEAPON_LOWERED_ANGLES = Angle(30, -30, -25);
local IRONSIGHT_TIME = 0.3;

function PLUGIN:CalcViewModelView(weapon, viewModel, oldEyePos, oldEyeAngles, eyePos, eyeAngles)
	if (!IsValid(weapon)) then return; end;

	if (not weapon.IronSightsPos or Clockwork.Client:KeyDown(IN_SPEED) or Clockwork.Client:KeyReleased(IN_SPEED) or !Clockwork.player:GetWeaponRaised(Clockwork.Client)) then
		return
	end;

	local bIron = weapon.Weapon:GetNWBool("Ironsights")

	if (bIron != weapon.bLastIron) then
		weapon.bLastIron = bIron
		weapon.fIronTime = CurTime()
	end

	local fIronTime = weapon.fIronTime or 0

	if (not bIron and fIronTime < CurTime() - IRONSIGHT_TIME) then
		return
	end

	local Mul = 1.0

	if (fIronTime > CurTime() - IRONSIGHT_TIME) then
		Mul = math.Clamp((CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1)

		if not bIron then Mul = 1 - Mul end
	end

	local Offset	= weapon.IronSightsPos

	if (weapon.IronSightsAng) then
		eyeAngles = eyeAngles * 1
		eyeAngles:RotateAroundAxis(eyeAngles:Right(), 		weapon.IronSightsAng.x * Mul)
		eyeAngles:RotateAroundAxis(eyeAngles:Up(), 		weapon.IronSightsAng.y * Mul)
		eyeAngles:RotateAroundAxis(eyeAngles:Forward(), 	weapon.IronSightsAng.z * Mul)
	end

	local Right 	= eyeAngles:Right()
	local Up 		= eyeAngles:Up()
	local Forward 	= eyeAngles:Forward()

	eyePos = eyePos + Offset.x * Right * Mul
	eyePos = eyePos + Offset.y * Forward * Mul
	eyePos = eyePos + Offset.z * Up * Mul

	return eyePos, eyeAngles;
end;