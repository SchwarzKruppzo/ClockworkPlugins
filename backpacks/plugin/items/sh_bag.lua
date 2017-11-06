
local ITEM = Clockwork.item:New("backpack_base");
ITEM.name = "Bag";
ITEM.uniqueID = "bag";
ITEM.value = 6;
ITEM.type = "misc";
ITEM.business = true;
ITEM.access = "v";
ITEM.cost = 30;
ITEM.model = "models/props_junk/garbage_bag001a.mdl";
ITEM.actualWeight = 0.5;
ITEM.invSpace = 2;
ITEM.slot = "back";
ITEM.slotSpace = 3;
ITEM.description = "A cloth bag with some cables. It's better than nothing...";

ITEM:Register();