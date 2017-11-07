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
	ITEM.name = "T-51b Power Armor";
	ITEM.weight = 50;
	ITEM.replacement = "models/t51b/t51h.mdl";
	ITEM.description = "It appears to be a suit of T-51b power armor.";
	ITEM.overlay = "T-51b";
	ITEM.specialBoost = {
		S = 4,
		E = 3,
		A = -3
	};
ITEM:Register();