local FACTION = Clockwork.faction:New("Conscripts");



FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "halfliferp/factions/conscripts";
FACTION.models = {
	female = {
		"models/models/army/female_01.mdl",
		"models/models/army/female_02.mdl",
		"models/models/army/female_03.mdl",
		"models/models/army/female_04.mdl",
		"models/models/army/female_06.mdl",
		"models/models/army/female_07.mdl"
	},
	male = {
		"models/wichacks/art.mdl",
 		"models/wichacks/erdim.mdl",
		"models/wichacks/eric.mdl",
		"models/wichacks/joe.mdl",
		"models/wichacks/mike.mdl",
		"models/wichacks/sandro.mdl",
		"models/wichacks/ted.mdl",
		"models/wichacks/van.mdl",
		"models/wichacks/vance.mdl"
	};
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name != FACTION_CITIZEN) then
		return false;
	end;
end;



FACTION_CONSCRIPT = FACTION:Register();