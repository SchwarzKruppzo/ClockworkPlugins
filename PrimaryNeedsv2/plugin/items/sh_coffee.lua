--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Coffee";
ITEM.cost = 6;
ITEM.model = "models/props_junk/garbage_coffeemug001a.mdl";
ITEM.weight = 0.8;
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.business = false;
ITEM.description = "A cup of coffee.";
ITEM.sleep = 25;
ITEM.thirst = 45;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp(player:Health() + 5, 0, 100) );
	player:SetCharacterData( "thirst", math.Clamp(player:GetCharacterData("thirst") - 5, 0, 100) );
	player:SetCharacterData( "sleep", math.Clamp(player:GetCharacterData("sleep") - 25, 0, 100) );
	player:BoostAttribute(self.name, ATB_ENDURANCE, 1, 120);
	player:BoostAttribute(self.name, ATB_STRENGTH, 1, 120);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register(ITEM);