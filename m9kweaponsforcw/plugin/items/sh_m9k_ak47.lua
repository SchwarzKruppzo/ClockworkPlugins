local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "AK-47";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_ak47_m9k.mdl";
ITEM.weight = 3.47;
ITEM.uniqueID = "m9k_ak47";
ITEM.business = false;
ITEM.description = "A somewhat oiled and clean rifle and chambers 7.62x39mm.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();