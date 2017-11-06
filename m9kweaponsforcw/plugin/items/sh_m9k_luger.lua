local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Luger P08";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_luger_p08.mdl";
ITEM.weight = 0.8708974;
ITEM.uniqueID = "m9k_luger";
ITEM.business = false;
ITEM.description = "Looks very old and rusty, probably doesnt even work, chambers 7.65x21 Parabellum.";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();
