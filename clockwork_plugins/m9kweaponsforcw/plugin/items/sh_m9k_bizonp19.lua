local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "PP-19 Bizon";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_pp19_bizon.mdl";
ITEM.weight = 2.1;
ITEM.uniqueID = "m9k_bizonp19";
ITEM.business = false;
ITEM.description = "An fairly new looking SMG, chambers 9x18mm Makarov.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
