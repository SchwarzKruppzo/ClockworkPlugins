local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "M92 Beretta";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_beretta_m92.mdl";
ITEM.weight = 0.95;
ITEM.uniqueID = "m9k_m92beretta";
ITEM.business = false;
ITEM.description = "A fairly new looking handgun and is very light, chambers 9x19mm Parabellum";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();
