local PLUGIN = PLUGIN;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (!lightSpawn) then
		local spawnPos = player:GetCharacterData("CustomSpawnPoint");
		
		if (spawnPos) then
			player:SetPos(Vector(spawnPos.x, spawnPos.y, spawnPos.z));
		end;
	end;
end;