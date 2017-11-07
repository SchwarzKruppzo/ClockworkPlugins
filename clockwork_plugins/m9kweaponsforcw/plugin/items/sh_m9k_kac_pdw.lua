local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "KAC PDW";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_kac_pdw.mdl";
ITEM.weight = 2.0;
ITEM.uniqueID = "m9k_kac_pdw";
ITEM.business = false;
ITEM.description = "A fairly new personal defense weapon, chambers 6x35mm.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();