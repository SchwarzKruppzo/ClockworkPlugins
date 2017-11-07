--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local CLASS = Clockwork.class:New("New California Republic");
	CLASS.color = Color(255, 150, 50, 255);
	CLASS.factions = {FACTION_NCR};
	CLASS.isDefault = true;
	CLASS.description = "A member of one of the most powerful military groups in New Vegas.";
	CLASS.defaultPhysDesc = "Wearing military gear and equipment";
CLASS_NCR = CLASS:Register();