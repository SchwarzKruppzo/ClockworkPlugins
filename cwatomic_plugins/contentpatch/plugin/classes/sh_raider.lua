--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local CLASS = Clockwork.class:New("Raider");
	CLASS.color = Color(160, 30, 0, 255);
	CLASS.factions = {FACTION_RAIDER};
	CLASS.isDefault = true;
	CLASS.description = "A merciless bandit that lives off of others' misfortune.";
	CLASS.defaultPhysDesc = "Wearing dirty and scratched combat armor";
CLASS_RAIDER = CLASS:Register();