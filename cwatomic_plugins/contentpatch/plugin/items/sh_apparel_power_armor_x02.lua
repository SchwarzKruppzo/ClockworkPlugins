--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("base_power_armor");
	ITEM.cost = 1000;
	ITEM.name = "X-02 Advanced Power Armor";
	ITEM.weight = 50;
	ITEM.replacement = "models/fallout_3/enclave_power_armor.mdl";
	ITEM.description = "It appears to be a suit of X-02 power armor, it seems almost sinister in appearance.";
	ITEM.overlay = "X-02";
	ITEM.specialBoost = {
		S = 4,
		E = 3,
		A = -3
	};
ITEM:Register();