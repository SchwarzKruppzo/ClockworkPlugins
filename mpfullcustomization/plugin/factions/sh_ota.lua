/*--------------------------------------------------------------------------\
| THIS ENTIRE PLUGIN IS CREATED BY VIOMI                                    |
| PLEASE DO NOT COPY OR SELL ANY CODE IN HERE WITHOUT PERMISSION FROM VIOMI |
| Contact: viomi@openmailbox.org                                            |
\--------------------------------------------------------------------------*/

local FACTION = Clockwork.faction:New("Overwatch Transhuman Arm")

FACTION.isCombineFaction = true
FACTION.whitelist = true
FACTION.material = "halfliferp/factions/ota"
FACTION.models = {
	female = {nmodels["eow"]},
	male = {nmodels["eow"]}
}

-- Called when a player's name should be assigned for the faction.
function FACTION:GetName(player, character)
	local unitID = math.random(1, 99999)
	
	return otaprefix.."-"..nranks["echo"].."."..nranks["ows"].."-"..Clockwork.kernel:ZeroNumberToDigits(unitID, 5)
end

-- Called when a player's model should be assigned for the faction.
function FACTION:GetModel(player, character)
	if (character.gender == GENDER_MALE) then
		return self.models.male[1]
	else
		return self.models.female[1]
	end
end

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name == FACTION_MPF) then
		Clockwork.player:SetName(player, string.gsub(player:QueryCharacter("name"), ".+(%d%d%d%d%d)", otaprefix.."-"..nranks["echo"].."."..nranks["ows"].."-%1"), true)
	else
		Clockwork.player:SetName(player, self:GetName( player, player:GetCharacter() ), true)
	end
	
	if (player:QueryCharacter("gender") == GENDER_MALE) then
		player:SetCharacterData("model", self.models.male[1], true)
	else
		player:SetCharacterData("model", self.models.female[1], true)
	end
end

FACTION_OTA = FACTION:Register()