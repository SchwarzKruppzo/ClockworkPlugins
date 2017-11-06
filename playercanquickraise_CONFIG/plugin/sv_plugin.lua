--[[
	Adds a new config code.
	False is the default setting, so that the value will be for standart settings "false"
--]]

local PLUGIN = PLUGIN
local Clockwork = Clockwork

Clockwork.config:Add("quick_raise_enable", false);

--[[
	This function is a PLUGIN Hook. It checks if the code is 1 = true or 0 = false. 
	If its false no one can QuickRaise 
	If its true it will run the default code from sv_kernel.
--]]

-- A Function to check if the config setting is on false.
function PLUGIN:PlayerCanQuickRaise(player, weapon, key)
	if (Clockwork.config:Get("quick_raise_enable"):GetBoolean() == false) then
		return false;
	end;
end;