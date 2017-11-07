local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "AK-74";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_tct_ak47.mdl";
ITEM.weight = 3.07;
ITEM.uniqueID = "m9k_ak74";
ITEM.business = false;
ITEM.description = "Looks almost rotting and rusty, chambers 5.45x39mm.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();