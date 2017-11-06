local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Benelli M3";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_benelli_m3.mdl";
ITEM.weight = 3.27;
ITEM.uniqueID = "m9k_m3";
ITEM.business = false;
ITEM.description = "An old looking shotgun, though it looks well kept, requires either 12 or 20 gauge shells or slugs.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);



ITEM:Register();
