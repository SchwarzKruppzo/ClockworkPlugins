/*--------------------------------------------------------------------------\
| THIS ENTIRE PLUGIN IS CREATED BY VIOMI                                    |
| PLEASE DO NOT COPY OR SELL ANY CODE IN HERE WITHOUT PERMISSION FROM VIOMI |
| Contact: viomi@openmailbox.org                                            |
\--------------------------------------------------------------------------*/

local PLUGIN = PLUGIN

-- Called when the scoreboard's class players should be sorted.
function Schema:ScoreboardSortClassPlayers(class, a, b)
	if (class == mpfname or class == otaname) then
		local rankA = Schema:GetPlayerCombineRank(a)
		local rankB = Schema:GetPlayerCombineRank(b)
		
		if (rankA == rankB) then
			return a:Name() < b:Name()
		else
			return rankA > rankB
		end
	end
end

-- Called when a player's scoreboard class is needed.
function Schema:GetPlayerScoreboardClass(player)
	local faction = player:GetFaction()
	local customClass = player:GetSharedVar("customClass")

	if (customClass != "") then
		return customClass;
	end;

	if (faction == FACTION_MPF) then
		if (Schema:PlayerIsCombine(Clockwork.Client) or Clockwork.Client:IsAdmin() or !mpfhide) then
			return mpfname
		else
			return false
		end
	elseif (faction == FACTION_OTA) then
		if (Schema:PlayerIsCombine(Clockwork.Client) or Clockwork.Client:IsAdmin() or !mpfhide) then
			return otaname
		else
			return false
		end
	end
end