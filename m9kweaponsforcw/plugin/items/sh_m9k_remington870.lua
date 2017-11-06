local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Remington 870";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_remington_870_tact.mdl";
ITEM.weight = 3.2;
ITEM.uniqueID = "m9k_remington870";
ITEM.business = false;
ITEM.description = "A very sleek looking shotgun, looks very well taken care of, requires 12 gauge.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
