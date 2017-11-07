local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Winchester 87";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_winchester_1887.mdl";
ITEM.weight = 3.6;
ITEM.uniqueID = "m9k_1887winchester";
ITEM.business = false;
ITEM.description = "An rotting and rusty lever action shotgun, requires 12 or 10 gauge.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
