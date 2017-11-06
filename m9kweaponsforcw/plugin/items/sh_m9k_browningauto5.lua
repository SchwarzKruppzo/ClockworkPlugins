local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Browning Auto-5";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_browning_auto.mdl";
ITEM.weight = 4.1;
ITEM.uniqueID = "m9k_browningauto5";
ITEM.business = false;
ITEM.description = "A very old looking shotgun and also rusty, requires 12 gauge,16 and 20.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
