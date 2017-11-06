local PLUGIN = PLUGIN;
--this is a consumable item normally effecting attributes.
local ITEM = Clockwork.item:New(); --Items like these don't need a base.
ITEM.name = ""; --Item name.
ITEM.cost = ; --Item cost. The number must be connected to the semi colon, example: "= 999;"
ITEM.model = ""; --Item model.
ITEM.weight = ; --Item weight. The number must be connected to the semi colon, example: "= 999;"
ITEM.access = ""; --Access flag.
ITEM.useText = ""; --The use text which is show when you left click the item.
ITEM.business = true/false; --PICK ONE. Whether it's in the business menu or not.
ITEM.category = "Consumables"; --The catagory of the item; keeping organisation in check.
ITEM.description = ""; --Item description.

-- Called when the item is used.
function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;

-- Called when the item is dropped.
function ITEM:OnDrop(player, position) end; --The item will be dropped at the players cross hair position. Best leave it be

ITEM:Register();