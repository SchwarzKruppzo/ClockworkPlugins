local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "HK USC";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_hk_usc.mdl";
ITEM.weight = 2.7;
ITEM.uniqueID = "m9k_usc";
ITEM.business = false;
ITEM.description = "An old and some of the handle has fallen off, chambers .45 ACP.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
