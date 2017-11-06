local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "M29 Satan";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_m29_satan.mdl";
ITEM.weight = 1.585;
ITEM.uniqueID = "m9k_m29satan";
ITEM.business = false;
ITEM.description = "A very rusty looking revolver, the barrel being most of the weight and chambers .44 Magnum.";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();
