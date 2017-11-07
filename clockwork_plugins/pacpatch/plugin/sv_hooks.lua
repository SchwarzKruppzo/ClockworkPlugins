local PLUGIN = PLUGIN;

-- Called when a player's character has loaded.
function PLUGIN:PlayerCharacterLoaded(player)
	player:ConCommand("pac_clear_parts")
end;