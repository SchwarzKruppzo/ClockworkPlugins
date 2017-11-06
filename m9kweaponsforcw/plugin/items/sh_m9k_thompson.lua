local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Thompson M1928";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_tommy_gun.mdl";
ITEM.weight = 4.9;
ITEM.uniqueID = "m9k_thompson";
ITEM.business = false;
ITEM.description = "A very rusty and old looking gun, has the serial number scratched off, chambers .45 ACP.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
