local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Taurus Raging Bull";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_taurus_raging_bull.mdl";
ITEM.weight = 2.20;
ITEM.uniqueID = "m9k_ragingbull";
ITEM.business = false;
ITEM.description = "A six cylinder revolver that is partly rusty but does chamber .44 Magnum";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();
