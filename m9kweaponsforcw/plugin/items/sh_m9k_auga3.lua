local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Steyr AUG-A3";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_auga3.mdl";
ITEM.weight = ;
ITEM.uniqueID = "m9k_auga3";
ITEM.business = false;
ITEM.description = "A bullpup assault rife that looks new, chambers 5.56x45mm NATO.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();