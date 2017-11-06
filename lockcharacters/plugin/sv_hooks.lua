local PLUGIN = PLUGIN;

function PLUGIN:PlayerCanSwitchCharacter(player, character)
	if (player:GetCharacterData("permakilled")) then
		return true;
	end;
	
	if (player:GetSharedVar("tied") != 0) then
		return false, "You cannot switch to this character while tied!";
	end;
	local charactersLocked = Clockwork.config:Get("lock_characters"):Get()
	if (charactersLocked) then
		return false, "Character switching is currently disabled!";
	end;
end;