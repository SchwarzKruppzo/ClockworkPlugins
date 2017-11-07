local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "SR-3 Vikr";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_dmg_vikhr.mdl";
ITEM.weight = 2;
ITEM.uniqueID = "m9k_vikhr";
ITEM.business = false;
ITEM.description = "A compact assault rifle that chambers 9x39mm.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();