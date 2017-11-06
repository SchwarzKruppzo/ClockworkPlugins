local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "MP5SD";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_hk_mp5sd.mdl";
ITEM.weight = 2.8;
ITEM.uniqueID = "m9k_mp5sd";
ITEM.business = false;
ITEM.description = "An SMG with an integrated sliencer, looks fairly new and good looking, chambers 9x19mm Parabellum.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();