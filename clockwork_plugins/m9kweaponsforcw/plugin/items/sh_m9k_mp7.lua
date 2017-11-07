local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "HK MP7";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_brugger_thomet_mp9.mdl";
ITEM.weight = 2.14;
ITEM.uniqueID = "m9k_mp7";
ITEM.business = false;
ITEM.description = "A compact SMG with a silencer on the barrel, chambers 4.6x30mm.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
