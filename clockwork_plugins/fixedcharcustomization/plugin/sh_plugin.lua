local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_hooks.lua");

--[[ 
	Run the file now that the schema has 
	loaded and we can override the default
	menu.
--]]
function PLUGIN:ClockworkSchemaLoaded()
	Clockwork.kernel:IncludePrefixed(self:GetBaseDir().."/cl_character.lua");
end;