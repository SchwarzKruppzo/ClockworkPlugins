local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Ares Shrike";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_ares_shrike.mdl";
ITEM.weight = 3.4;
ITEM.uniqueID = "m9k_ares_shrike";
ITEM.business = false;
ITEM.description = "A rusty and old looking LMG and chambers 5.56x45mm NATO.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();