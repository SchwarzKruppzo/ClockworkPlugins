--[[
	� 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Cremator");
	CLASS.color = Color(255, 165, 0, 255);
	CLASS.wages = 0;
	CLASS.factions = {FACTION_CREMATOR};
	CLASS.isDefault = true;
	CLASS.wagesName = "Supplies";
	CLASS.description = "A tall dark figure with a strange head.";
	CLASS.defaultPhysDesc = "A tall dark figure with a strange head.";
CLASS_CREMATOR = CLASS:Register();