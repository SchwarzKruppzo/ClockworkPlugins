/*--------------------------------------------------------------------------\
| THIS ENTIRE PLUGIN IS CREATED BY VIOMI                                    |
| PLEASE DO NOT COPY OR SELL ANY CODE IN HERE WITHOUT PERMISSION FROM VIOMI |
| Contact: viomi@openmailbox.org                                            |
\--------------------------------------------------------------------------*/

local FACTION = Clockwork.faction:New("Metropolice Force")

FACTION.isCombineFaction = true
FACTION.whitelist = true
FACTION.material = "halfliferp/factions/mpf"
FACTION.models = {
	female = {nmodels["recruit"]},
	male = {nmodels["recruit"]}
}

-- Called when a player's name should be assigned for the faction.
function FACTION:GetName(player, character)
	return mpfprefix.."."..cityname.."-"..nranks["recruit"].."."..Clockwork.kernel:ZeroNumberToDigits(math.random(1, 99999), 5)
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
	if (faction.name == FACTION_OTA) then
		if (name) then
			Clockwork.player:SetName(player, string.gsub(player:QueryCharacter("name"), ".+(%d%d%d%d%d)", mpfprefix.."-"..nranks["recruit"]..".%1"), true)
		else
			return false, "You need to specify a name as the third argument!"
		end
	else
		Clockwork.player:SetName( player, self:GetName( player, player:GetCharacter() ) )
	end

	if (player:QueryCharacter("gender") == GENDER_MALE) then
		player:SetCharacterData("model", self.models.male[1], true)
	else
		player:SetCharacterData("model", self.models.female[1], true)
	end

	if Schema:IsPlayerCombineRank(player, nranks["recruit"]) then
		Clockwork.class:Set(player, CLASS_MPR)
	elseif Schema:IsPlayerCombineRank(player, nranks["AI"]) then
		Clockwork.class:Set(player, CLASS_AI)
	else
		Clockwork.class:Set(player, CLASS_MPU)
	end
end

FACTION_MPF = FACTION:Register()