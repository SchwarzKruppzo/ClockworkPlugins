local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "FN P90";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_fn_p90.mdl";
ITEM.weight = 2.6;
ITEM.uniqueID = "m9k_smgp90";
ITEM.business = false;
ITEM.description = "A compact and newly made SMG, has a top slide magazine, chambers FN 5.7x28mm";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
