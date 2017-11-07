--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local PLUGIN = PLUGIN;

Clockwork.kernel:IncludePrefixed("cl_plugin.lua");

if (SERVER) then
	Clockwork.config:Add("power_armor_perk", true, true);
else
	Clockwork.config:AddToSystem("Power Armor Requires Perk", "power_armor_perk", "Whether or not power armor requires the power armor training perk to use.");
end;