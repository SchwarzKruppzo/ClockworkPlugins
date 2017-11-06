local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "FN F2000";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_fn_f2000.mdl";
ITEM.weight = 3.6;
ITEM.uniqueID = "m9k_f2000";
ITEM.business = false;
ITEM.description = "An old looking bullpup assault rifle that chambers 5.56x45mm.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();