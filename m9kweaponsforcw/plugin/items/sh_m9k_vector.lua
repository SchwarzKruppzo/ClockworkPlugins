local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "KRISS Vector";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_kriss_vector.mdl";
ITEM.weight = 2.7;
ITEM.uniqueID = "m9k_vector";
ITEM.business = false;
ITEM.description = "A very new SMG, has no rust what so ever, also looks very well take care of, chambers .45 ACP.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();