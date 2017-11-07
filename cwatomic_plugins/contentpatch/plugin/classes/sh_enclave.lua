--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local CLASS = Clockwork.class:New("Enclave");
	CLASS.color = Color(0, 120, 0, 255);
	CLASS.factions = {FACTION_ENCLAVE};
	CLASS.isDefault = true;
	CLASS.description = "A member of the powerful organization known as the Enclave.";
	CLASS.defaultPhysDesc = "Wearing a sinister looking set of Power Armor.";
CLASS_ENCLAVE = CLASS:Register();