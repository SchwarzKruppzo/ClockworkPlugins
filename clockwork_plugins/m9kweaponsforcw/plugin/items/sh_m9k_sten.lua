local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "STEN Mk.II";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_sten.mdl";
ITEM.weight = 3.2;
ITEM.uniqueID = "m9k_sten";
ITEM.business = false;
ITEM.description = "A very rusty and old SMG, has a british flag on the left side of the SMG, chambers 9x19mm Parabellum.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();