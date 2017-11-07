local PLUGIN = PLUGIN;


-- Called when a player uses a door
function PLUGIN:PlayerCanUseDoor(player, door)
    if (Clockwork.entity:IsDoor(door)) then
		if (door:GetClass() == "func_door" and player:HasItemByID("combine_card")) then
            door:Fire("Open","","0");
        end;
    end;
end;



-- Called when a player uses an entity
function PLUGIN:PlayerUse(player, entity)
		if (entity:GetClass() == "cw_combinelock" and player:HasItemByID("combine_card")) then
			local curTime = CurTime();
			if (!player.nextCombineLock or curTime >= player.nextCombineLock) then
				entity:Toggle();
				
				player.nextCombineLock = curTime + 3;
			end;
			return false;
		end;
end;