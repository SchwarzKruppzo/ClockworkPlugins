local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Barrett M82";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_barret_m82.mdl";
ITEM.weight = 13.5;
ITEM.uniqueID = "m9k_barret_m82";
ITEM.business = false;
ITEM.description = "An very heavy sniper, has litte to none rust, chambers .50 BMG";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
