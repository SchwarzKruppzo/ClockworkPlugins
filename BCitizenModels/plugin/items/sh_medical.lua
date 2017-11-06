--[[
	? 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "CWU. Medical Jacket";
ITEM.group = "betacz";
ITEM.weight = 2;
ITEM.access = "m";
ITEM.business = true;
ITEM.description = "A medical Jacket assigned to Civil Workers, It has a Universal Union insignia.";

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	if (string.lower( player:GetModel() ) == "models/humans/group01/male_01.mdl") then
		return "models/betacz/group03m/male_01.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/humans/group01/male_02.mdl") then
		return "models/betacz/group03m/male_02.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/humans/group01/male_03.mdl") then
		return "models/betacz/group03m/male_03.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/humans/group01/male_04.mdl") then
		return "models/betacz/group03m/male_04.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/humans/group01/male_05.mdl") then
		return "models/betacz/group03m/male_05.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/humans/group01/male_06.mdl") then
		return "models/betacz/group03m/male_06.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/humans/group01/male_07.mdl") then
		return "models/betacz/group03m/male_07.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/humans/group01/male_08.mdl") then
		return "models/betacz/group03m/male_08.mdl";
    end;   
    	if (string.lower( player:GetModel() ) == "models/humans/group01/male_09.mdl") then
		return "models/betacz/group03m/male_09.mdl";
    end;  
        if (string.lower( player:GetModel() ) == "models/humans/group01/female_01.mdl") then
		return "models/betacz/group03m/female_01.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/humans/group01/female_02.mdl") then
		return "models/betacz/group03m/female_02.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/humans/group01/female_03.mdl") then
		return "models/betacz/group03m/female_03.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/humans/group01/female_04.mdl") then
		return "models/betacz/group03m/female_04.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/humans/group01/female_06.mdl") then
		return "models/betacz/group03m/female_06.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/humans/group01/female_07.mdl") then
		return "models/betacz/group03m/female_07.mdl";
    end;
    
    
    
-- Group 2



	if (string.lower( player:GetModel() ) == "models/betacz/group02/male_01.mdl") then
		return "models/betacz/group03m/male_01.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group02/male_02.mdl") then
		return "models/betacz/group03m/male_02.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/betacz/group02/male_03.mdl") then
		return "models/betacz/group03m/male_03.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/betacz/group02/male_04.mdl") then
		return "models/betacz/group03m/male_04.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group02/male_05.mdl") then
		return "models/betacz/group03m/male_05.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group02/male_06.mdl") then
		return "models/betacz/group03m/male_06.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group02/male_07.mdl") then
		return "models/betacz/group03m/male_07.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group02/male_08.mdl") then
		return "models/betacz/group03m/male_08.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group02/male_09.mdl") then
		return "models/betacz/group03m/male_09.mdl";
    end;
        if (string.lower( player:GetModel() ) == "models/betacz/group02/female_01.mdl") then
		return "models/betacz/group03m/female_01.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/betacz/group02/female_02.mdl") then
		return "models/betacz/group03m/female_02.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/betacz/group02/female_03.mdl") then
		return "models/betacz/group03m/female_03.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/betacz/group02/female_04.mdl") then
		return "models/betacz/group03m/female_04.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group02/female_06.mdl") then
		return "models/betacz/group03m/female_06.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group02/female_07.mdl") then
		return "models/betacz/group03m/female_07.mdl";
    end;

    
    -- Factory
    
    	if (string.lower( player:GetModel() ) == "models/humans/factory/male_01.mdl") then
		return "models/betacz/group03m/male_01.mdl";
    end;  
    	if (string.lower( player:GetModel() ) == "models/humans/factory/male_02.mdl") then
		return "models/betacz/group03m/male_02.mdl";
    end;   
	    if (string.lower( player:GetModel() ) == "models/humans/factory/male_03.mdl") then
		return "models/betacz/group03m/male_03.mdl";
    end;   
	    if (string.lower( player:GetModel() ) == "models/humans/factory/male_04.mdl") then
		return "models/betacz/group03m/male_04.mdl";
    end;  
    	if (string.lower( player:GetModel() ) == "models/humans/factory/male_05.mdl") then
		return "models/betacz/group03m/male_05.mdl";
    end;  
    	if (string.lower( player:GetModel() ) == "models/humans/factory/male_06.mdl") then
		return "models/betacz/group03m/male_06.mdl";
    end;   
    	if (string.lower( player:GetModel() ) == "models/humans/factory/male_07.mdl") then
		return "models/betacz/group03m/male_07.mdl";
    end;    
    	if (string.lower( player:GetModel() ) == "models/humans/factory/male_08.mdl") then
		return "models/betacz/group03m/male_08.mdl";
    end;  
    	if (string.lower( player:GetModel() ) == "models/humans/factory/male_09.mdl") then
		return "models/betacz/group03m/male_09.mdl";
    end;   
        if (string.lower( player:GetModel() ) == "models/humans/factory/female_01.mdl") then
		return "models/betacz/group03m/female_01.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/humans/factory/female_02.mdl") then
		return "models/betacz/group03m/female_02.mdl";
    end;
        if (string.lower( player:GetModel() ) == "models/humans/factory/female_03.mdl") then
		return "models/betacz/group03m/female_03.mdl";
    end;   
	    if (string.lower( player:GetModel() ) == "models/humans/factory/female_04.mdl") then
		return "models/betacz/group03m/female_04.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/humans/factory/female_06.mdl") then
		return "models/betacz/group03m/female_06.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/humans/factory/female_07.mdl") then
		return "models/betacz/group03m/female_07.mdl";
    end;

    
    
    -- Group 3
    
    
    
    	if (string.lower( player:GetModel() ) == "models/betacz/group03/male_01.mdl") then
		return "models/betacz/group03m/male_01.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group03/male_02.mdl") then
		return "models/betacz/group03m/male_02.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/betacz/group03/male_03.mdl") then
		return "models/betacz/group03m/male_03.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/betacz/group03/male_04.mdl") then
		return "models/betacz/group03m/male_04.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group03/male_05.mdl") then
		return "models/betacz/group03m/male_05.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group03/male_06.mdl") then
		return "models/betacz/group03m/male_06.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group03/male_07.mdl") then
		return "models/betacz/group03m/male_07.mdl";
    end;    
    	if (string.lower( player:GetModel() ) == "models/betacz/group03/male_08.mdl") then
		return "models/betacz/group03m/male_08.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group03/male_09.mdl") then
		return "models/betacz/group03m/male_09.mdl";
    end;
        if (string.lower( player:GetModel() ) == "models/betacz/group03/female_01.mdl") then
		return "models/betacz/group03m/female_01.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/betacz/group03/female_02.mdl") then
		return "models/betacz/group03m/female_02.mdl";
    end;
        if (string.lower( player:GetModel() ) == "models/betacz/group03/female_03.mdl") then
		return "models/betacz/group03m/female_03.mdl";
    end;   
	    if (string.lower( player:GetModel() ) == "models/betacz/group03/female_04.mdl") then
		return "models/betacz/group03m/female_04.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group03/female_06.mdl") then
		return "models/betacz/group03m/female_06.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group03/female_07.mdl") then
		return "models/betacz/group03m/female_07.mdl";
    end;

    
    
    -- Group 1
    

	    if (string.lower( player:GetModel() ) == "models/betacz/group01/male_01.mdl") then
		return "models/betacz/group03m/male_01.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group01/male_02.mdl") then
		return "models/betacz/group03m/male_02.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group01/male_03.mdl") then
		return "models/betacz/group03m/male_03.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group01/male_04.mdl") then
		return "models/betacz/group03m/male_04.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group01/male_05.mdl") then
		return "models/betacz/group03m/male_05.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group01/male_06.mdl") then
		return "models/betacz/group03m/male_06.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group01/male_07.mdl") then
		return "models/betacz/group03m/male_07.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group01/male_08.mdl") then
		return "models/betacz/group03m/male_08.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group01/male_09.mdl") then
		return "models/betacz/group03m/male_09.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group01/female_01.mdl") then
		return "models/betacz/group03m/female_01.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group01/female_02.mdl") then
		return "models/betacz/group03m/female_02.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group01/female_03.mdl") then
		return "models/betacz/group03m/female_03.mdl";
    end;
        if (string.lower( player:GetModel() ) == "models/betacz/group01/female_04.mdl") then
		return "models/betacz/group03m/female_04.mdl";
    end;
        if (string.lower( player:GetModel() ) == "models/betacz/group01/female_06.mdl") then
		return "models/betacz/group03m/female_06.mdl";
    end;
        if (string.lower( player:GetModel() ) == "models/betacz/group01/female_07.mdl") then
		return "models/humans/factory/female_07.mdl";
    end;
    
        -- Self
    
    	if (string.lower( player:GetModel() ) == "models/betacz/group03m/male_01.mdl") then
		return "models/betacz/group03m/male_01.mdl";
    end;  
    	if (string.lower( player:GetModel() ) == "models/betacz/group03m/male_02.mdl") then
		return "models/betacz/group03m/male_02.mdl";
    end;   
	    if (string.lower( player:GetModel() ) == "models/betacz/group03m/male_03.mdl") then
		return "models/betacz/group03m/male_03.mdl";
    end;   
	    if (string.lower( player:GetModel() ) == "models/betacz/group03m/male_04.mdl") then
		return "models/betacz/group03m/male_04.mdl";
    end;  
    	if (string.lower( player:GetModel() ) == "models/betacz/group03m/male_05.mdl") then
		return "models/betacz/group03m/male_05.mdl";
    end;  
    	if (string.lower( player:GetModel() ) == "models/betacz/group03m/male_06.mdl") then
		return "models/betacz/group03m/male_06.mdl";
    end;   
    	if (string.lower( player:GetModel() ) == "models/betacz/group03m/male_07.mdl") then
		return "models/betacz/group03m/male_07.mdl";
    end;    
    	if (string.lower( player:GetModel() ) == "models/betacz/group03m/male_08.mdl") then
		return "models/betacz/group03m/male_08.mdl";
    end;  
    	if (string.lower( player:GetModel() ) == "models/betacz/group03m/male_09.mdl") then
		return "models/betacz/group03m/male_09.mdl";
    end;   
        if (string.lower( player:GetModel() ) == "models/betacz/group03m/female_01.mdl") then
		return "models/betacz/group03m/female_01.mdl";
    end;
	    if (string.lower( player:GetModel() ) == "models/betacz/group03m/female_02.mdl") then
		return "models/betacz/group03m/female_02.mdl";
    end;
        if (string.lower( player:GetModel() ) == "models/betacz/group03m/female_03.mdl") then
		return "models/betacz/group03m/female_03.mdl";
    end;   
	    if (string.lower( player:GetModel() ) == "models/betacz/group03m/female_04.mdl") then
		return "models/betacz/group03m/female_04.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group03m/female_06.mdl") then
		return "models/betacz/group03m/female_06.mdl";
    end;
    	if (string.lower( player:GetModel() ) == "models/betacz/group03m/female_07.mdl") then
		return "models/betacz/group03m/female_07.mdl";
    end;
    
    
end;

ITEM:Register();
