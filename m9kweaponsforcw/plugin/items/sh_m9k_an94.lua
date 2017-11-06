local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "AN-94";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_rif_an_94.mdl";
ITEM.weight = 3.85;
ITEM.uniqueID = "m9k_an94";
ITEM.business = false;
ITEM.description = "A rusty assault rifle that chambers 5.45x39mm.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();