local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "USAS-12";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_usas_12.mdl";
ITEM.weight = 5.45;
ITEM.uniqueID = "m9k_usas";
ITEM.business = false;
ITEM.description = "An automatic shotgun that looks like it has never been used, requires 12-gauge.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
