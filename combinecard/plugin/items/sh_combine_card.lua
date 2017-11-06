local ITEM = Clockwork.item:New();
ITEM.name = "Combine Card";
ITEM.cost = 26;
ITEM.model = "models/gibs/metal_gib4.mdl";
ITEM.weight = 0.1;
ITEM.classes = {CLASS_EMP, CLASS_EOW};
ITEM.business = false;
ITEM.description = "A card with the with the UU symbol engraved onto it.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;


ITEM:Register();