local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "OTs-03 SVU";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_dragunov_svu.mdl";
ITEM.weight = 3.6;
ITEM.uniqueID = "m9k_svu";
ITEM.business = false;
ITEM.description = "Looks very new, looks like it has been taken care of, chambers 7.62x54mmR";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
