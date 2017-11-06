
local ITEM = Clockwork.item:New("backpack_base");
ITEM.name = "Backpack";
ITEM.uniqueID = "backpack";
ITEM.model = "models/props_junk/garbage_bag001a.mdl";
ITEM.actualWeight = 2;
ITEM.invSpace = 6;
ITEM.slot = "back";
ITEM.slotSpace = 6;
ITEM.description = "An old backpack in a good enough state to hold some stuff.";

ITEM:Register();