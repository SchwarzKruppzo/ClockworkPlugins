--[[
	Screw your green text!
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Parkour";
	ITEM.cost = 5000;
	ITEM.model = "models/props_lab/huladoll.mdl";
	ITEM.weight = 0.1;
	ITEM.access = "V";
	ITEM.uniqueID = "climb_swep2";
	ITEM.description = "A magical hula doll that lets you climb..";
ITEM:Register();