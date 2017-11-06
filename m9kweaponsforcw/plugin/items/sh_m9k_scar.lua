local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "FN SCAR-H";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_fn_scar_h.mdl";
ITEM.weight = 3.49;
ITEM.uniqueID = "m9k_scar";
ITEM.business = false;
ITEM.description = "A heavy looking weapon but looks very newly produced and chambers 7.62x51mm NATO.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();