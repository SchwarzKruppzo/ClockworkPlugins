--[[
        � 2016 CloudSixteen.com do not share, re-distribute or modify
        without permission of its author (kurozael@gmail.com).
--]]
 
local ITEM = Clockwork.item:New("weapon_base");
        ITEM.name = "Belomorkanal Cigarette";
        ITEM.cost = 10;
        ITEM.model = "models/mordeciga/mordes/pachkacig.mdl";
        ITEM.weight = 0.2;
        ITEM.uniqueID = "weapon_ciga_pachka_cheap";
        ITEM.description = "A cheap looking pack of cigarettes, doesn't look too healthy.'";
        ITEM.isAttachment = true;
        ITEM.hasFlashlight = false;
ITEM:Register();