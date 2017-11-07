--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local FACTION = Clockwork.faction:New("Raider");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "atomic/factions/raider";
FACTION.buttonMat = "atomic/factions/raider_button";
FACTION.description = "You are a bloodthirsty bandit, pillaging and killing innocent survivors of the wasteland. You won't let anything get in the way of your self-gratification.";

FACTION.startingInv = {
	["handheld_radio"] = 1,
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

FACTION_RAIDER = FACTION:Register();