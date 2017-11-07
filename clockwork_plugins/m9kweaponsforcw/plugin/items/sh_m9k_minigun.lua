local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "M134 Minigun";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_m134_minigun.mdl";
ITEM.weight = 39;
ITEM.uniqueID = "m9k_minigun";
ITEM.business = false;
ITEM.description = "A very heavy minigun and chambers 7.62x51mm NATO.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();