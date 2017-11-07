local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "73 Winchester Carbine";
ITEM.cost = 0;
ITEM.model = "models/weapons/v_winchester1873.mdl";
ITEM.weight = 3.3;
ITEM.uniqueID = "m9k_winchester73";
ITEM.business = false;
ITEM.description = "An old rusty looking lever action rifle that chambers .44-40 cartridges.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();