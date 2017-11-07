local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Mossberg 590";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_mossberg_590.mdl";
ITEM.weight = 2.5;
ITEM.uniqueID = "m9k_mossberg590";
ITEM.business = false;
ITEM.description = "A pump action shotgun that is slightly rusty looking, requires 12, 20 or .410 bore.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
