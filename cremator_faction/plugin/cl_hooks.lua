local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called to check if a player does recognise another player.
function PLUGIN:PlayerDoesRecognisePlayer(player, status, isAccurate, realValue)
	local faction = player:GetFaction();
	if ( faction == FACTION_CREMATOR ) then
		return true;
	end;
end;
