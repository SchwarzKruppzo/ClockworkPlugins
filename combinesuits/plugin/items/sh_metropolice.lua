local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Metropolice Uniform";
ITEM.cost = 500;
ITEM.replacement = "models/dpfilms/metropolice/hdpolice.mdl";
ITEM.weight = 3;
ITEM.access = "v" or "N";
ITEM.business = true;
ITEM.protection = 0.5;
ITEM.description = "A metropolice suit, used for being disguised or for training.";

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	if (string.lower( player:GetModel() ) == "models/humans/group01/jasona.mdl") then
		return "models/dpfilms/metropolice/hdpolice.mdl";
	end;
end;

ITEM:Register();