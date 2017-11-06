
--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.name = "MP7 Grenade";
	ITEM.cost = 50;
	ITEM.classes = {CLASS_EOW};
	ITEM.model = "models/items/ar2_grenade.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "ammo_smg1_grenade";
	ITEM.business = true;
	ITEM.ammoClass = "smg1_grenade";
	ITEM.ammoAmount = 1;
	ITEM.description = "A large bullet shaped item, you'll figure it out.";
ITEM:Register();