local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "LAW-12";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_spas_12.mdl";
ITEM.weight = 4.4;
ITEM.uniqueID = "m9k_spas12";
ITEM.business = false;
ITEM.description = "Very rusty and old looking pump action action shotgun, requires 12 gauge 2 3⁄4";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
