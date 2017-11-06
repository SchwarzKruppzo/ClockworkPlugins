
local ITEM = Clockwork.item:New("backpack_base");
ITEM.name = "Toolbelt";
ITEM.uniqueID = "toolbelt";
ITEM.model = "models/Items/CrossbowRounds.mdl";
ITEM.actualWeight = 1;
ITEM.invSpace = 2;
ITEM.slot = "belt";
ITEM.slotSpace = 10;
ITEM.description = "A toolbelt with two large pockets on the side.";

ITEM:Register();