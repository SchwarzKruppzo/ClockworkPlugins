--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("beta_base");
ITEM.name = "Constructor Uniform";
ITEM.group = "group02";
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
		return "models/betacz/group02/male_01.mdl";
	end;
end;

ITEM:Register();