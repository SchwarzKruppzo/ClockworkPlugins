local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Winchester 1897";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_winchester_1897_trench.mdl";
ITEM.weight = 3.6;
ITEM.uniqueID = "m9k_1897winchester";
ITEM.business = false;
ITEM.description = "A pump action shotgun that doesnt look old and has little to no rust, requires 12 or 16 gauge.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
