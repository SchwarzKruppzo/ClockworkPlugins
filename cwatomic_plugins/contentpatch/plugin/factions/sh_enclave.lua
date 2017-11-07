--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local FACTION = Clockwork.faction:New("Enclave");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "atomic/factions/enclave";
FACTION.buttonMat = "atomic/factions/enclave_button";
FACTION.description = "You are a part of the Enclave, a secretive descendant of the pre-war United States Government."

FACTION.startingInv = {
	["handheld_radio"] = 1,
    ["X-02 Power Armor"] = 1
};

FACTION.friendlyFactions = {
	"Crimson Caravan"
};

FACTION.startingPerks = {
    "Power Armor Training"
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
end;

FACTION_ENCLAVE = FACTION:Register();