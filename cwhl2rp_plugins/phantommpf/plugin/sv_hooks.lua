local PlayerIsCombine = Schema.PlayerIsCombine;
function Schema:PlayerIsCombine(player)
    if (player:GetCharacterData("PhantomUndercover")) then
         return false;
    end;
    return PlayerIsCombine(Schema, player);
end;

function PLUGIN:GetPlayerDefaultModel(player)
	if (Schema:PlayerIsCombine(player)) then
		if(string.find(player:GetName(), "PHANTOM")) then
			return PHANTOMModel;
		end;
	end;
end;

function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (Schema:PlayerIsCombine(player)) then
		if(string.find(player:GetName(), "PHANTOM")) then
			player:SetModel(PHANTOMModel);
			return;
		end;
	end;
end;

function PLUGIN:PlayerNameChanged(player, previousName, newName)
	if (Schema:PlayerIsCombine(player)) then
		if(string.find(player:GetName(), "PHANTOM")) then
			player:SetModel(PHANTOMModel);
			return;
		end;
	end;
end;

function PLUGIN:PlayerAdjustCharacterScreenInfo(player, character, info)
	if (Schema:PlayerIsCombine(player)) then
		if(string.find(player:GetName(), "PHANTOM")) then
			info.model = PHANTOMModel;
			return;
		end;
	end;
end;