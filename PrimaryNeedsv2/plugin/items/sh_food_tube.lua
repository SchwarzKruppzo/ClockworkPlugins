--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Hunger Tube";
ITEM.cost = 6;
ITEM.model = "models/props_junk/cardboard_box004a.mdl";
ITEM.weight = 0.8;;
ITEM.useText = "Chew";
ITEM.category = "Consumables";
ITEM.business = false;
ITEM.description = "It's Scrumpadoochous! \n Warning: Not actually Scrumpadoochous";
ITEM.hunger = 45;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp(player:Health() + 5, 0, 100) );
	player:BoostAttribute(self.name, ATB_ENDURANCE, 1, 120);
	player:BoostAttribute(self.name, ATB_STRENGTH, 1, 120);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register(ITEM);