--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local CLASS = Clockwork.class:New("Caesar's Legion");
	CLASS.color = Color(230, 50, 50, 255);
	CLASS.factions = {FACTION_LEGION};
	CLASS.isDefault = true;
	CLASS.description = "A ruthless zealot looking to conquer in the name of Caesar.";
	CLASS.defaultPhysDesc = "Wearing scratched and worn combat robes.";
CLASS_LEGION = CLASS:Register();