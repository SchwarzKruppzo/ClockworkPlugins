local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Armsel Striker";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_striker_12g.mdl";
ITEM.weight = 4.4;
ITEM.uniqueID = "m9k_striker12";
ITEM.business = false;
ITEM.description = "A rusty looking shotgun with a drum by the trigger, requires 12 gauge.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
