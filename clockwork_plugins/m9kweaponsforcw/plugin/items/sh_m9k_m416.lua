local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "HK416";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_hk_416.mdl";
ITEM.weight = 2.950;
ITEM.uniqueID = "m9k_m416";
ITEM.business = false;
ITEM.description = "A rather looking rusty assault rifle that chambers 5.56x45mm NATO.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();