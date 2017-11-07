--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local FACTION = Clockwork.faction:New("Crimson Caravan");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "atomic/factions/caravan";
FACTION.buttonMat = "atomic/factions/caravan_button";
--FACTION.modelGroup = {34, 37, 38, 40, 41, 42, 43};
FACTION.description = "You are a part of the Crimson Caravan, an economic faction focusing on trade and transport of goods."

FACTION.startingInv = {
	["handheld_radio"] = 1,
};

FACTION.friendlyFactions = {
	"Crimson Caravan",
	"Wastelander",
	"Enclave",
	"New California Republic",
	"Brotherhood of Steel",
	"Caesar's Legion"
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
end;

FACTION_CARAVAN = FACTION:Register();