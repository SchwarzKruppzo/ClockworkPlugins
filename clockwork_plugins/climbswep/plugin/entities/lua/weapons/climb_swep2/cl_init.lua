include("shared.lua")

CreateClientConVar("climbswep2_showhud", 1, true, false)
SWEP.PrintName       = "Climb SWEP 2"
SWEP.Slot             = 0
SWEP.SlotPos         = 4
SWEP.DrawAmmo         = false
SWEP.DrawCrosshair     = false

local flags = {FCVAR_REPLICATED, FCVAR_ARCHIVE};
CreateConVar("climbswep2_necksnaps", "0", flags);
CreateConVar("climbswep2_wallrun_minheight", "250", flags);
CreateConVar("climbswep2_roll_allweps", "0", flags);
CreateConVar("climbswep2_slide_allweps", "0", flags);
CreateConVar("climbswep2_maxjumps", "3", flags);