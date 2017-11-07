--[[
        � 2016 CloudSixteen.com do not share, re-distribute or modify
        without permission of its author (kurozael@gmail.com).
--]]
 
local ITEM = Clockwork.item:New("weapon_base");
        ITEM.name = "Yava Cigarette";
        ITEM.cost = 20;
        ITEM.model = "models/mordeciga/mordes/boxopenshib.mdl";
        ITEM.weight = 0.2;
        ITEM.uniqueID = "weapon_ciga_pachka";
        ITEM.description = "An old looking packet of standard cigarettes.";
        ITEM.isAttachment = true;
        ITEM.hasFlashlight = false;
ITEM:Register();