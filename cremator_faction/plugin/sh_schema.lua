local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

function PLUGIN:PlayerIsCremator(faction)
	return (faction == FACTION_CREMATOR);
end;

-- Borrowed this from RJ, sorry!
function PLUGIN:IsCrematorFaction(player)
	if (!IsValid(player)) then
		return;
	end;

	local faction = player:GetFaction();
	
	if (PLUGIN:PlayerIsCremator(faction)) then
		-- if (faction == FACTION_CREMATOR) then
			return true;
		else
			return false;
		-- end;
	end;
end;


--[[ Function to check if the player is combine. - Never finished
function PLUGIN:(player)
	if player:GetFaction() == FACTION_CREMATOR then
		return FACTION.playerIsCombine = true;
	end;
--]]

--[[ A function to get if a faction is Combine. -- Broken!
function Schema:IsCombineFaction(faction) 
	return (faction == FACTION_CREMATOR); 
end;
--]]

--[[ A Function to check if the player can open a Combine Door. -- Broken!
function Schema:PlayerCanUseDoor(player, door)
    if (self:PlayerIsCombine(player) and player:GetFaction() == FACTION_CREMATOR) then
        return true;
    end;
end;
--]]
