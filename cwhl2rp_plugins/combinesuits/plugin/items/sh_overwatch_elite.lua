local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Overwatch Elite Uniform";
ITEM.cost = 1000;
ITEM.replacement = "models/Combine_Super_Soldier.mdl";
ITEM.weight = 6;
ITEM.access = "N" or "V";
ITEM.business = true;
ITEM.protection = 2.0;
ITEM.description = "A Overwatch Elite suit, used for being disguised or super protection.";

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	if (string.lower( player:GetModel() ) == "models/humans/group01/jasona.mdl") then
		return "models/Combine_Super_Soldier.mdl";
	end;
end;

ITEM:Register();