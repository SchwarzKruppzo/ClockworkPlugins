/*--------------------------------------------------------------------------\
| THIS ENTIRE PLUGIN IS CREATED BY VIOMI                                    |
| PLEASE DO NOT COPY OR SELL ANY CODE IN HERE WITHOUT PERMISSION FROM VIOMI |
| Contact: viomi@openmailbox.org                                            |
\--------------------------------------------------------------------------*/

local PLUGIN = PLUGIN

function PLUGIN:GetPlayerDefaultModel(player)
	local faction = player:GetFaction()

	if (Schema:IsCombineFaction(faction)) then
		// Non-divisions
		for i in pairs(nranks) do
			if self:IsPlayerCombineRank(player, nranks[i]) then
				return nmodels[i]
			end
		end

		for i in ipairs(divisions) do
			if self:IsPlayerCombineRank(player, divisions[i]) then
				for v in pairs(ranks) do
					if self:IsPlayerCombineRank(player, ranks[v]) then
						return models[divisions[i]][ranks[v]]
					end
				end
			end
		end
	end
end

function PLUGIN:PlayerNameChanged(player, previousName, newName)
	if (Schema:PlayerIsCombine(player)) then
		local faction = player:GetFaction()
	
		if (faction == FACTION_OTA) then
			if (!Schema:IsStringCombineRank(previousName, nranks["ows"]) and Schema:IsStringCombineRank(newName, nranks["ows"])) then
				Clockwork.class:Set(player, CLASS_OWS)
			elseif (!Schema:IsStringCombineRank(previousName, nranks["eow"]) and Schema:IsStringCombineRank(newName, nranks["eow"])) then
				Clockwork.class:Set(player, CLASS_EOW)
			end

		elseif (faction == FACTION_MPF) then
			if Schema:IsStringCombineRank(newName, nranks["scanner"]) then
				Clockwork.class:Set(player, CLASS_MPS, true)
				Schema:MakePlayerScanner(player, true)
			end

			for i in pairs(nranks) do
				if Schema:IsStringCombineRank(newName, nranks[i]) then
					player:SetModel(nmodels[i])
				end

				if Schema:IsStringCombineRank(newName, nranks["recruit"]) then
					Clockwork.class:Set(player, CLASS_MPR)
				end
			end

// DIVISIONS
			for i in ipairs(divisions) do
				if Schema:IsStringCombineRank(newName, divisions[i]) then
					for v in pairs(ranks) do
						if Schema:IsStringCombineRank(newName, ranks[v]) then
							Clockwork.class:Set(player, CLASS_MPU)
							player:SetModel(models[divisions[i]][ranks[v]])
						end
					end
				end
			end
		end
	end
end

function PLUGIN:PlayerAdjustCharacterScreenInfo(player, character, info)
	if (info.faction == FACTION_OTA) then
		if Schema:IsStringCombineRank(info.name, nranks["eow"]) then
			info.model = nmodels["eow"]
		elseif Schema:IsStringCombineRank(info.name, nranks["ows"]) then
			info.model = nmodels["ows"]
		end
	elseif Schema:IsCombineFaction(info.faction) then
		if Schema:IsStringCombineRank(info.name, nranks["scanner"]) then
			if Schema:IsStringCombineRank(info.name, nranks["synth"]) then
				info.model = nmodels["synth"]
			else
				info.model = nmodels["scanner"]
			end
		end

		for i in pairs(nranks) do
			if Schema:IsStringCombineRank(info.name, nranks[i]) then
				info.model = nmodels[i]
			end
		end

		for i in ipairs(divisions) do
			if Schema:IsStringCombineRank(info.name, divisions[i]) then
				for v in pairs(ranks) do
					if Schema:IsStringCombineRank(info.name, ranks[v]) then
						info.model = models[divisions[i]][ranks[v]]
					end
				end
			end
		end
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
			else
				Clockwork.class:Set(player, CLASS_MPU)
			end
		end
	end
end