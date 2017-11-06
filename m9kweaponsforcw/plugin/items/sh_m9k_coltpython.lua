local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Colt Python";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_colt_python.mdl";
ITEM.weight = 1.4;
ITEM.uniqueID = "m9k_coltpython";
ITEM.business = false;
ITEM.description = "Very rusty and old looking, chambers .357 Magnum";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();