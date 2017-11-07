local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "AS Val";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_dmg_vally.mdl";
ITEM.weight = 2.5;
ITEM.uniqueID = "m9k_val";
ITEM.business = false;
ITEM.description = "A medium size special assault rifle that also has a built in silencer, chambers 9x39mm. ";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();