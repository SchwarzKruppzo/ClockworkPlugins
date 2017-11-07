local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "TEC-9";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_intratec_tec9.mdl";
ITEM.weight = 1.4;
ITEM.uniqueID = "m9k_tec9";
ITEM.business = false;
ITEM.description = "A very small SMG, looks untouched, chambers 9x19mm Parabellum.";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
