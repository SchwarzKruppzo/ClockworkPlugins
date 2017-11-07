--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Worker Uniform";
ITEM.group = "factory";
ITEM.weight = 2;
ITEM.batch = 1;
ITEM.cost = 200;
ITEM.access = "z";
ITEM.business = true;
ITEM.protection = 0.1;
ITEM.description = "Clean, Union approved clothing consisting of white shirt, white t-shirt, green jeans and brown shoes.";

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	if (string.lower( player:GetModel() ) == "models/humans/group01/jasona.mdl") then
		return "models/humans/factory/male_01.mdl";
	end;
end;

ITEM:Register();