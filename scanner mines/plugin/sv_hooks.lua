local PLUGIN = PLUGIN;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (!lightSpawn) then
		player.mineReady = false;
	end;
end;

-- Called when a player presses a key.
function PLUGIN:KeyPress(player, key)
	if (key == IN_DUCK) then
		if (Schema.scanners[player]) then
			if Schema:IsPlayerCombineRank(player, "SYNTH") then
				if player.mineReady == true then
					Clockwork.player:RunClockworkCommand(player, "MineDeploy");
				else
					Clockwork.player:RunClockworkCommand(player, "MineEquip");
				end;
			end;
		end;
	end;
end;