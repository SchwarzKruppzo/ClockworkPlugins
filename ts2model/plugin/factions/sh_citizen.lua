--[[
	� 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local FACTION = Clockwork.faction:New("Citizen");

FACTION.useFullName = true;
FACTION.material = "halfliferp/factions/citizen";
FACTION.models = {
	female = {
		"models/tnb/citizens/aphelion/female_01.mdl",
		"models/tnb/citizens/aphelion/female_02.mdl",
		"models/tnb/citizens/aphelion/female_03.mdl",
		"models/tnb/citizens/aphelion/female_04.mdl",
		"models/tnb/citizens/aphelion/female_05.mdl",
		"models/tnb/citizens/aphelion/female_08.mdl",
		"models/tnb/citizens/aphelion/female_09.mdl",
		"models/tnb/citizens/aphelion/female_10.mdl",
		"models/tnb/citizens/aphelion/female_11.mdl"
	},
	male = {
		"models/tnb/citizens/aphelion/male_01.mdl",
 		"models/tnb/citizens/aphelion/male_02.mdl",
		"models/tnb/citizens/aphelion/male_03.mdl",
		"models/tnb/citizens/aphelion/male_04.mdl",
		"models/tnb/citizens/aphelion/male_05.mdl",
		"models/tnb/citizens/aphelion/male_06.mdl",
		"models/tnb/citizens/aphelion/male_07.mdl",
		"models/tnb/citizens/aphelion/male_09.mdl",
		"models/tnb/citizens/aphelion/male_16.mdl"
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

FACTION_CITIZEN = FACTION:Register();