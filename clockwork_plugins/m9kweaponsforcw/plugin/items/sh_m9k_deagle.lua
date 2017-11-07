local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Desert Eagle Mark XIX";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_tcom_deagle.mdl";
ITEM.weight = 4.4;
ITEM.uniqueID = "m9k_deagle";
ITEM.business = false;
ITEM.description = "Newly made Mark XIX desert eagle, has some weight to it than a normal pistol, also chambers .50 Action Express";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();