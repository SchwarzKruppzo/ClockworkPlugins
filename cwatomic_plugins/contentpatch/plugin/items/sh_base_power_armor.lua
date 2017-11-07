--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("base_apparel", true);
	ITEM.name = "base_power_armor";
	ITEM.uniqueID = "base_power_armor";
	ITEM.useSound = {};
	ITEM.isPowerArmor = true;
	ITEM.baseArmor = 100;
	ITEM.isRareSpawn = true;

	for i = 1, 12 do
		table.insert(ITEM.useSound, "atomic/power_armor/equip_"..i..".wav");
	end;

	ITEM.walkSound = "atomic/power_armor/step_01.mp3";
	ITEM.runSound = "atomic/power_armor/step_01.mp3";

	function ITEM:CanPlayerWear(player)
		local hasPerk = player:HasPerk("Power Armor Training");

		if (Clockwork.config:Get("power_armor_perk"):GetBoolean() and !hasPerk) then
			Clockwork.player:Notify(player, "You are unable to equip power armor!");
			return false;
		end;
	end;
ITEM:Register();