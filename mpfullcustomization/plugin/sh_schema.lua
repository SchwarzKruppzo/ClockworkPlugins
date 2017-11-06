/*--------------------------------------------------------------------------\
| THIS ENTIRE PLUGIN IS CREATED BY VIOMI                                    |
| PLEASE DO NOT COPY OR SELL ANY CODE IN HERE WITHOUT PERMISSION FROM VIOMI |
| Contact: viomi@openmailbox.org                                            |
\--------------------------------------------------------------------------*/


local PLUGIN = PLUGIN

-- A function to check if a player is a Combine rank.
function PLUGIN:IsPlayerCombineRank(player, rank, realRank)
	local name = player:Name()
	local faction = player:GetFaction()
	
	if (Schema:IsCombineFaction(faction)) then
		if (type(rank) == "table") then
			for k, v in ipairs(rank) do
				if (self:IsPlayerCombineRank(player, v, realRank)) then
					return true
				end
			end
		elseif (rank == "EpU" and !realRank) then
			if (string.find(name, "%p"..nranks["sectorial"].."%p") or string.find(name, "%p"..ranks["divisionleader"].."%p") or string.find(name, "%p"..nranks["commander"].."%p") or string.find(name, "%p"..nranks["AI"].."%p")) then
				return true
			end
		else
			return string.find(name, "%p"..rank.."%p")
		end
	end
end

-- A function to check if a string is a Combine rank.
function Schema:IsStringCombineRank(text, rank)
	if (type(rank) == "table") then
		for k, v in ipairs(rank) do
			if (self:IsStringCombineRank(text, v)) then
				return true
			end
		end
	elseif (rank == "EpU") then
		if (string.find(text, "%p"..nranks["sectorial"].."%p") or string.find(text, "%p"..ranks["divisionleader"].."%p") or string.find(text, "%p"..nranks["commander"].."%p")) then
			return true
		end
	else
		return string.find(text, "%p"..rank.."%p")
	end
end

-- A function to get a player's Combine rank.
function Schema:GetPlayerCombineRank(player)
	local faction = player:GetFaction()
	
	if (faction == FACTION_OTA) then
		if (self:IsPlayerCombineRank(player, nranks["ows"])) then
			return 0
		elseif (self:IsPlayerCombineRank(player, nranks["eow"])) then
			return 1
		else
			return 2
		end
	end

	local x = 0
	for i in ipairs(divisions) do
		if self:IsPlayerCombineRank(player, divisions[i]) then
			for v in ipairs(ranks[i]) do
				x = x + 1
				if self:IsPlayerCombineRank(player, ranks[v]) then
					return i*x
				end
			end
		end
	end
	
	local count = 0
	if self:IsPlayerCombineRank(player, nranks["sectorial"]) then
		for i in ipairs(divisions) do
			for v in pairs(ranks) do
				count = count + 1
			end
		end 
		return count + 4
	elseif self:IsPlayerCombineRank(player, nranks["commander"]) then
		for i in ipairs(divisions) do
			for v in pairs(ranks) do
				count = count + 1
			end
		end 
		return count + 3
	elseif self:IsPlayerCombineRank(player, nranks["scanner"]) then
		for i in ipairs(divisions) do
			for v in pairs(ranks) do
				count = count + 1
			end
		end
		if !self:IsPlayerCombineRank(player, nranks["synth"]) then
			return count + 1
		else
			return count + 2
		end
	elseif self:IsPlayerCombineRank(player, nranks["AI"]) then
		return 999
	else
		return 5
	end
end

function PLUGIN:PlayerCharacterLoaded(player)
	if Schema:PlayerIsCombine(player) then
		local faction = player:GetFaction()

		if faction == FACTION_OTA then
			if self:IsPlayerCombineRank(player, nranks["eow"]) then
				Clockwork.class:Set(player, CLASS_EOW)
			elseif self:IsPlayerCombineRank(player, nranks["ows"]) then
				Clockwork.class:Set(player, CLASS_OWS)
			end
		elseif faction == FACTION_MPF then
			if Schema:IsPlayerCombineRank(player, nranks["recruit"]) then
				Clockwork.class:Set(player, CLASS_MPR)
			elseif Schema:IsPlayerCombineRank(player, nranks["AI"]) then
				Clockwork.class:Set(player, CLASS_AI)
			else
				Clockwork.class:Set(player, CLASS_MPU)
			end
		end
	end
end