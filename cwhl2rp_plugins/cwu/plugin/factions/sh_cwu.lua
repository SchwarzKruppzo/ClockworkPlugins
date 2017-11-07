local FACTION = Clockwork.faction:New("Civil Workers' Union");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "halfliferp/factions/cwu";

FACTION.models = {
	female = {
		"models/humans/Group02/female_02.mdl",
		"models/humans/Group02/female_04.mdl",
		"models/humans/Group02/female_07.mdl"
	},
	male = {
		"models/humans/Group02/male_02.mdl",
		"models/humans/Group02/male_04.mdl",
		"models/humans/Group02/male_06.mdl",
		"models/humans/Group02/male_08.mdl"
	};
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (Schema:PlayerIsCombine(player)) then
		if (name) then
			local models = self.models[ string.lower( player:QueryCharacter("gender") ) ];
			
			if (models) then
				player:SetCharacterData("model", models[ math.random(#models) ], true);
				
				Clockwork.player:SetName(player, name, true);
			end;
		else
			return false, "You need to specify a name as the third argument!";
		end;
	end;
end;

FACTION_CWU = FACTION:Register();