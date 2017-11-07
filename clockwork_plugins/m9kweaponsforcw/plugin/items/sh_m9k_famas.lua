local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "FAMAS-F1";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_tct_famas.mdl";
ITEM.weight = 3.61;
ITEM.uniqueID = "m9k_famas";
ITEM.business = false;
ITEM.description = "An bullpup assault rifle that is rusty looking and chambers 5.56x45mm NATO.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();