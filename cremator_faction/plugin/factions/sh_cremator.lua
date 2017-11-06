--[[
	� 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local FACTION = Clockwork.faction:New("Cremator");

FACTION.isCombineFaction = true;
FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.models = {
	female = {"models/cremator.mdl"},
	male = {"models/cremator.mdl"}
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name != FACTION_CITIZEN) then
		return false;
	end;

	if (player:QueryCharacter("gender") == GENDER_MALE) then
		player:SetCharacterData("model", self.models.male[1], true);
	else
		player:SetCharacterData("model", self.models.female[1], true);
	end;
end;

-- Called when a player's model should be assigned for the faction.
function FACTION:GetModel(player, character)
	if (character.gender == GENDER_MALE) then
		return self.models.male[1];
	else
		return self.models.female[1];
	end;
end;


-- Called when a player's name should be assigned for the faction.
function FACTION:GetName(player, character)
	local crmID = math.random(1, 999);

	return "UU-CREMATOR."..Clockwork.kernel:ZeroNumberToDigits(crmID, 3);
end;

FACTION_CREMATOR = FACTION:Register();