local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "AMD-65";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_amd_65.mdl";
ITEM.weight = 3.8;
ITEM.uniqueID = "m9k_amd65";
ITEM.business = false;
ITEM.description = "A partly well kept rifle and chambers 7.62x39mm.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();