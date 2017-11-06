local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "FN FAL";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_fn_fal.mdl";
ITEM.weight = 4.3;
ITEM.uniqueID = "m9k_fal";
ITEM.business = false;
ITEM.description = "A rusty and old looking battle rifle that chambers 7.62 NATO and .280 British.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();