local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "SW Model 3 Russian";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_model_3_rus.mdl";
ITEM.weight = 1.3;
ITEM.uniqueID = "m9k_model3russian";
ITEM.business = false;
ITEM.description = "An old and rusty looking six cylinder revolver that chambers .44 Russian.";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();
