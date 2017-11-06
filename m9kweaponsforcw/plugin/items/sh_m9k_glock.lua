local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Glock 18";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_dmg_glock.mdl";
ITEM.weight = 1.6;
ITEM.uniqueID = "m9k_glock";
ITEM.business = false;
ITEM.description = "A fully automatic variant of the Glock 18, chambers 9x19mm Parabellum.";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();