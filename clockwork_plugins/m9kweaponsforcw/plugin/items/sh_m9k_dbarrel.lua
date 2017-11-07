local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Coach Gun";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_double_barrel_shotgun.mdl";
ITEM.weight = 4.4;
ITEM.uniqueID = "m9k_dbarrel";
ITEM.business = false;
ITEM.description = "A rusty looking shotgun, requires 10 and 12-gauge shells.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
