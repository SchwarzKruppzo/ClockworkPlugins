local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "HK UMP45";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_hk_ump45.mdl";
ITEM.weight = 2.65;
ITEM.uniqueID = "m9k_ump45";
ITEM.business = false;
ITEM.description = "A light and fairly rusty SMG, has a integrated vertical foregrip, chambers .45 ACP.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
