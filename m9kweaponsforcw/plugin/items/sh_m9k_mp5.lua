local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "HK MP5";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_hk_mp5.mdl";
ITEM.weight = 2.5;
ITEM.uniqueID = "m9k_mp5";
ITEM.business = false;
ITEM.description = "An infamous SMG that has been very newly made, chambers 9x19mm Parabellum.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
