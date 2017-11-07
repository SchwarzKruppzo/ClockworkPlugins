local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "SW Model 627";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_sw_model_627.mdl";
ITEM.weight = 1.236039;
ITEM.uniqueID = "m9k_model627";
ITEM.business = false;
ITEM.description = "A very new looking revolver, looks very clean also, chambers .357 Magnum.";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();
