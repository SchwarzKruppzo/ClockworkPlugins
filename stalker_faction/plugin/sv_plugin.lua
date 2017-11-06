local PLUGIN = PLUGIN

-- A function to check if a player is an Stalker.
function PLUGIN:PlayerIsStalker(player)
	if (IsValid(player) and player:GetCharacter()) then
		local faction = player:GetFaction();
		
		if (PLUGIN:IsStalkerFaction(faction)) then
			return true;
		else
			return false;
		end;
	end;
end;