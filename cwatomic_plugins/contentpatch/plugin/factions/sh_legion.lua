--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local FACTION = Clockwork.faction:New("Caesar's Legion");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "atomic/factions/legion";
FACTION.buttonMat = "atomic/factions/legion_button";
FACTION.description = "You are a part of Caesar's Legion, a ruthless nation of bandits that conquers any who oppose them."

FACTION.startingInv = {
	["handheld_radio"] = 1,
};

FACTION.friendlyFactions = {
	"Crimson Caravan"
};

FACTION.models = {
	female = {
		"models/humans/group51/female_01.mdl",
		"models/humans/group51/female_02.mdl",
		"models/humans/group51/female_03.mdl",
		"models/humans/group51/female_04.mdl",
		"models/humans/group51/female_06.mdl",
		"models/humans/group51/female_07.mdl"
	},
	male = {
		"models/humans/group51/male_01.mdl",
		"models/humans/group51/male_02.mdl",
		"models/humans/group51/male_03.mdl",
		"models/humans/group51/male_04.mdl",
		"models/humans/group51/male_05.mdl",
		"models/humans/group51/male_06.mdl",
		"models/humans/group51/male_07.mdl",
		"models/humans/group51/male_08.mdl",
		"models/humans/group51/male_09.mdl"
	};
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
end;

FACTION_LEGION = FACTION:Register();