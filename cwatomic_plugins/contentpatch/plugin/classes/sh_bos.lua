--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local CLASS = Clockwork.class:New("Brotherhood of Steel");
	CLASS.color = Color(160, 160, 180, 255);
	CLASS.factions = {FACTION_BROTHERHOOD};
	CLASS.isDefault = true;
	CLASS.description = "A member of the heavily armed Brotherhood of Steel.";
	CLASS.defaultPhysDesc = "Wearing a dark grey Power Armor set";
CLASS_BROTHERHOOD = CLASS:Register();