local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Maschinenpistole 40";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_mp40smg.mdl";
ITEM.weight = 3.97;
ITEM.uniqueID = "m9k_mp40";
ITEM.business = false;
ITEM.description = "A very old looking SMG, also very rust. Chambers 9x19mm Parabellum.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();