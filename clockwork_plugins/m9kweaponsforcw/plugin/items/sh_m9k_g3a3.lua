local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "HK G3A3";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_hk_g3.mdl";
ITEM.weight = 4.1;
ITEM.uniqueID = "m9k_g3a3";
ITEM.business = false;
ITEM.description = "A rusty looking battle rifle that chambers 7.62x51mm NATO.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();