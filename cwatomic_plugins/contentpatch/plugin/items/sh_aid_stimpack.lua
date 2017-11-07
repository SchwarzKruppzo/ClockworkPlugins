--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("base_heal");
	ITEM.name = "Stimpack";
	ITEM.cost = 100;
	ITEM.batch = 1;
	ITEM.model = "models/fallout_aid/stimpak/stimpak.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Inject";
	ITEM.description = "A medical stimpack, it says 'Military' on the front of it.";
	ITEM.baseHeal = 40;
ITEM:Register();