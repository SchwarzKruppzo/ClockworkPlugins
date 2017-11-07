local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "IMI UZI";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_uzi_imi.mdl";
ITEM.weight = 3.5;
ITEM.uniqueID = "m9k_uzi";
ITEM.business = false;
ITEM.description = "Small looking SMG, has an expandable stock, chambers 9mm Parabellum.";
ITEM.isAttachment = false;
ITEM.hasFlashlight = true;

ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();