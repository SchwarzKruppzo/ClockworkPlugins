local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Colt 1911";
ITEM.cost = 0;
ITEM.model = "models/weapons/s_dmgf_co1911.mdl";
ITEM.weight = 1.105;
ITEM.uniqueID = "m9k_colt1911";
ITEM.business = false;
ITEM.description = "A rusty looking pistol that chambers .45 ACP.";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);


ITEM:Register();