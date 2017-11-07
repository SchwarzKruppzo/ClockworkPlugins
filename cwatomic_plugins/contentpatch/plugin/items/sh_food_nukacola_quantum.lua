--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New();
	ITEM.name = "Nuka-Cola Quantum";
	ITEM.cost = 40;
	ITEM.model = "models/nukacola/nukaq2.mdl";
	ITEM.batch = 1;
	ITEM.weight = 1;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.useText = "Drink";
	ITEM.business = true;
	ITEM.category = "Consumables";
	ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav", "npc/barnacle/barnacle_gulp2.wav"};
	ITEM.description = "A bottle filled with a dark liquid.";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:SetHealth(math.Clamp(player:Health() + 8, 0, player:GetMaxHealth()));

		Clockwork.player:GiveCash(player, 1, "drinking nuka-cola");
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();