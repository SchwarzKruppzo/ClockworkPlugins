--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Rappel Rope";
ITEM.cost = 4;
ITEM.model = "models/items/crossbowrounds.mdl";
ITEM.weight = 0.5;
ITEM.access = "v";
ITEM.useText = "Rappel";
ITEM.factions = {FACTION_MPF, FACTION_OTA};
ITEM.business = false;
ITEM.category = "Reusables";
ITEM.description = "A back metalic rope.";

-- Called when a player uses the item.ply:GetActiveWeapon():GetClass()


function ITEM:OnUse(player,entity)
	if (Schema:PlayerIsCombine(player)) then
		local playerweapon = player:GetActiveWeapon():GetClass()
		if ( playerweapon ~= "weapon_physgun" or playerweapon ~= "weapon_physcannon" or playerweapon ~= "gmod_tool") then
			if player:OnGround() then
				if PlayerRappel then
 					return PlayerRappel(player,entity,self)
 				end
 			else
 				Clockwork.player:Notify(player, "You can't rappel whilst falling.");
 				return false;
			end			
    	else
        	Clockwork.player:Notify(player, "Don't rappel with the physgun or toolgun.");
        	return false;
		end
	else
		Clockwork.player:Notify(player, "You are unable to use this!");
		return false;
	end
end


ITEM:Register();

