local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "M14";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_snip_m14sp.mdl";
ITEM.weight = 9.2;
ITEM.uniqueID = "m9k_m14sp";
ITEM.business = false;
ITEM.description = "A marksman rifle that is very old and rusty and chambers 7.62x51mm NATO.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();