local ITEM = Clockwork.item:New("weapon_base");
ITEM.name = "Remington Model 1858";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_remington_1858.mdl";
ITEM.weight = 1.27;
ITEM.uniqueID = "m9k_remington1858";
ITEM.business = false;
ITEM.description = "A very, very, very old and rusty revolver, good luck trying to fix it, chambers (If you could call it that) Powder and ball with conical bullets.";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();
