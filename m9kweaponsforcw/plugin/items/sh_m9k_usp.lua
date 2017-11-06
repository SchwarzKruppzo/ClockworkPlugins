local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "HK USP";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_pist_fokkususp.mdl";
ITEM.weight = 0.74;
ITEM.uniqueID = "m9k_usp";
ITEM.business = false;
ITEM.description = "A very new looking handgun, chambers 9x19mm Parabellum.";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();