--[[
	© 2013 Slidefuse.net
	© 2015 Novabox.org
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Cassette Player";
ITEM.uniqueID = "cassette_player"
ITEM.cost = 50;
ITEM.model = "models/devcon/mrp/props/player_2.mdl";
ITEM.weight = 2;
ITEM.access = "v";
ITEM.classes = {CLASS_EMP, CLASS_EOW};
ITEM.category = "Music";
ITEM.business = true;
ITEM.description = "It's a state of the art cassette player. <color='2B62E3'>This item is legal.</color>";
ITEM.spawnType = "misc";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local trace = player:GetEyeTraceNoCursor();
	
	if (trace.HitPos:Distance( player:GetShootPos() ) <= 192) then
		local entity = ents.Create("t_cassette_player");
		
		Clockwork.player:GiveProperty(player, entity);
		
		entity:SetItemTable(self);
		entity:SetPos(trace.HitPos);
		entity:Spawn();
		
		Clockwork.entity:MakeFlushToGround(entity, trace.HitPos, trace.HitNormal);
		
		cassetteplugin:SaveCassettes()

	else
		Clockwork.player:Notify(player, "You cannot drop a cassette player that far away!");
		
		return false;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();