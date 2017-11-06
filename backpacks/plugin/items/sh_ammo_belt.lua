
local ITEM = Clockwork.item:New("backpack_base");
ITEM.name = "Ammo Belt";
ITEM.uniqueID = "ammo_belt";
ITEM.model = "models/Items/CrossbowRounds.mdl";
ITEM.actualWeight = 1;
ITEM.invSpace = 4;
ITEM.slot = "belt";
ITEM.slotSpace = 10;
ITEM.description = "A belt with ammo pouches attached. Can store more than just ammo in them though.";

ITEM:Register();