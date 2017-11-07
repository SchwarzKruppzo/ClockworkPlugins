--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local FACTION = Clockwork.faction:New("New California Republic");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "atomic/factions/california";
FACTION.buttonMat = "atomic/factions/california_button";
FACTION.description = "You are a part of the New California Republic, a nation that spans a good deal of the wasteland."

FACTION.startingInv = {
	["handheld_radio"] = 1,
};

FACTION.friendlyFactions = {
	"Crimson Caravan",
	"Wastelander"
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
end;

FACTION_NCR = FACTION:Register();