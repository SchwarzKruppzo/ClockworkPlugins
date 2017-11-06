local PLUGIN = PLUGIN;

local ITEM = Clockwork.item:New("ammo_base"); --This is the item base, this one in particular is a ammo_base
	ITEM.name = ""; --The name of the item.
	ITEM.cost = ; --The cost of the item. The number must be connected to the semi colon, example: "= 999;"
	ITEM.model = ""; --The model of the item which is viewed in the inventory and on self.
	ITEM.weight = ; --The weight of the item. The number must be connected to the semi colon, example: "= 999;"
	ITEM.access = ""; --The flag which allows this weapon to be accessed from menus.
	ITEM.uniqueID = ""; --CW item. The identifier which is called out in other scripts. Goes in between the brackets.
	ITEM.business = true; --PICK ONE. Whether or not this item is accessible from the business menu.
	ITEM.ammoClass = ""; --The type of ammo, depending on what it is it can have multiple uses for different guns. 
	ITEM.ammoAmount = 21; --The amount of ammo the ammo item carries.
	ITEM.description = ""; --Item description.
ITEM:Register(); --Leave alone.