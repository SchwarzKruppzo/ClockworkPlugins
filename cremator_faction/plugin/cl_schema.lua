local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called to check if a player does recognise another player.
function PLUGIN:PlayerDoesRecognisePlayer(player, status, isAccurate, realValue)
	local faction = player:GetFaction();
	if ( faction == FACTION_CREMATOR ) then
		return true;
	end;
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

