local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "AAC Honey Badger";
ITEM.cost = 0;
ITEM.model = "models/weapons/w_aac_honeybadger.mdl";
ITEM.weight = 2.9;
ITEM.uniqueID = "m9k_honeybadger";
ITEM.business = false;
ITEM.description = "A SMG style weapon, has a integrated suppressor, well well taken care of, chambers 7.62x35mm.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;


ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-4, 4, 4);

ITEM:Register();
