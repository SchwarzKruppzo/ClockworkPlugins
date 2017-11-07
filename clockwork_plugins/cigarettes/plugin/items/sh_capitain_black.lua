--[[
        � 2016 CloudSixteen.com do not share, re-distribute or modify
        without permission of its author (kurozael@gmail.com).
--]]
 
local ITEM = Clockwork.item:New("weapon_base");
        ITEM.name = "Capitain Black Cigarette";
        ITEM.cost = 40;
        ITEM.model = "models/mordeciga/mordes/pachkablat.mdl";
        ITEM.weight = 0.2;
        ITEM.uniqueID = "weapon_ciga_blat";
        ITEM.description = "A packet of old looking, yet high class cigarettes.";
        ITEM.isAttachment = true;
        ITEM.hasFlashlight = false;
ITEM:Register();