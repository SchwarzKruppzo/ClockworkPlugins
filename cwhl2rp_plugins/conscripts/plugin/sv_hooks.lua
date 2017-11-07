local PLUGIN = PLUGIN;

-- Initially give weapons and radio
function PLUGIN:GetPlayerDefaultInventory(player, character, inventory)
    if (character.faction == FACTION_CONSCRIPT) then
    Clockwork.inventory:AddInstance(
        inventory, Clockwork.item:CreateInstance("handheld_radio")
    );
    Clockwork.inventory:AddInstance(
        inventory, Clockwork.item:CreateInstance("weapon_smg1")
    );
    Clockwork.inventory:AddInstance(
        inventory, Clockwork.item:CreateInstance("backpack")
    );
        for i = 1, 2 do
			Clockwork.inventory:AddInstance(
				inventory, Clockwork.item:CreateInstance("ammo_smg1")
			);
		end;
    end;
end;

-- Resupply upon spawn
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
    if (player:GetFaction() == FACTION_CONSCRIPT) then
        if (player:GetAmmoCount("smg1") == 0) then
            if (!player:HasItemByID("ammo_smg1")) then
                for i = 1, 2 do
                    player:GiveItem(Clockwork.item:CreateInstance("ammo_smg1"), true);
                end;
            end;
        end;
        player:SetArmor(100);
    end;
end;