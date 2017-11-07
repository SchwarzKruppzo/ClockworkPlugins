local PLUGIN = PLUGIN;


-- Called every frame while a player is dead.
function PLUGIN:PlayerDeathThink(player)
  if (!player:HasInitialized() or player:GetCharacterData("CharTempBanned")) then
    return true;
  end;
end;

-- Called when a player attempts to use a character.
function PLUGIN:PlayerCanUseCharacter(player, character)
  if (character.data["CharTempBanned"]) then
    return character.name.." is temporarily banned and cannot be used!";
  end;
end;
