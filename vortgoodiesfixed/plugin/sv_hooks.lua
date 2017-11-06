-- Originally created by NightAngel, fixed by Viz.

local PLUGIN = PLUGIN;

function PLUGIN:PlayerGiveWeapons(player)	
	if (string.lower(player:GetModel()) == "models/vortigaunt_slave.mdl" or player:GetFaction() == FACTION_VORTSLAVE) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_broom");
	end;
end;