local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Overwatch Uniform";
ITEM.cost = 750;
ITEM.replacement = "models/combine_soldier.mdl";
ITEM.weight = 5;
ITEM.access = "V" or "N";
ITEM.business = true;
ITEM.protection = 1.0;
ITEM.description = "A Standard Overwatch suit, used for being disguised or extra protection.";

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	if (string.lower( player:GetModel() ) == "models/humans/group01/jasona.mdl") then
		return "models/combine_soldier.mdl";
	end;
end;

ITEM:Register();