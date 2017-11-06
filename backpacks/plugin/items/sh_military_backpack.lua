
local ITEM = Clockwork.item:New("backpack_base");
ITEM.name = "Military Backpack";
ITEM.uniqueID = "military_backpack";
ITEM.model = "models/props_junk/cardboard_box003b.mdl";
ITEM.actualWeight = 4;
ITEM.invSpace = 15;
ITEM.slot = "back";
ITEM.slotSpace = 10;
ITEM.description = "A pre-war military backpack that has somehow survived the wear of time.";

ITEM:Register();