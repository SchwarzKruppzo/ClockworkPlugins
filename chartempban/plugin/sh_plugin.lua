local PLUGIN = PLUGIN;

Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");

-- Called when the Clockwork shared variables are added.
function PLUGIN:ClockworkAddSharedVars(globalVars, playerVars)
  playerVars:Bool("CharTempBanned", true)
  playerVars:Number("CharBanTime", true);
end;

-- A function to set whether a player's character is banned.
function PLUGIN:SetTempBanned(player, banned, time)
	player:SetCharacterData("CharTempBanned", banned);
  player:SetCharacterData("CharBanTime", time);
	player:SaveCharacter();
	player:SetSharedVar("CharTempBanned", banned);
end;

-- A function to add a character to the character screen.
function Clockwork.player:CharacterScreenAdd(player, character)
	local info = {
		name = character.name,
		model = character.model,
		banned = character.data["CharBanned"],
    tempBanned = character.data["CharTempBanned"],
    banTime = character.data["CharBanTime"];
		faction = character.faction,
		characterID = character.characterID
	};

	if (character.data["PhysDesc"]) then
		if (string.utf8len(character.data["PhysDesc"]) > 64) then
			info.details = string.utf8sub(character.data["PhysDesc"], 1, 64).."...";
		else
			info.details = character.data["PhysDesc"];
		end;
	end;

	if (character.data["CharBanned"]) then
		info.details = "This character is banned.";
	end;

  if (character.data["CharTempBanned"]) then
    info.details = "This character is temporarily banned.";
  end;

	Clockwork.plugin:Call("PlayerAdjustCharacterScreenInfo", player, character, info);
	Clockwork.datastream:Start(player, "CharacterAdd", info);
end;
