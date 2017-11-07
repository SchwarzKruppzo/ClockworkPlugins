--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local FACTION = Clockwork.faction:New("Brotherhood of Steel");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "atomic/factions/bos";
FACTION.buttonMat = "atomic/factions/bos_button";
FACTION.description = "You are a member of the Brotherhood of Steel, dedicated to collecting and preserving pre-war technology."

FACTION.startingInv = {
	["handheld_radio"] = 1,
	["T-45d Power Armor"] = 1
};

FACTION.friendlyFactions = {
	"Crimson Caravan",
	"Wastelander"
};

FACTION.startingPerks = {
    "Power Armor Training"
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
end;

FACTION_BROTHERHOOD = FACTION:Register();