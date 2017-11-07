--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local CLASS = Clockwork.class:New("Crimson Caravan");
	CLASS.color = Color(120, 0, 0, 255);
	CLASS.flags = "T";
	CLASS.factions = {FACTION_CARAVAN};
	CLASS.isDefault = true;
	CLASS.description = "A member of the famous trading organization.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes and a large backpack";
CLASS_CARAVAN = CLASS:Register();