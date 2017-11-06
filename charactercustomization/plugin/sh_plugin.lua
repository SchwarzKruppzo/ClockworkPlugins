local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");

PLUGIN_META = {__index = PLUGIN_META};

if (SERVER) then
	Clockwork.kernel:IncludePrefixed("sv_cloudauthx.lua");
	AddCSLuaFile("cl_character.lua");
else
	--[[ 
		Run the file now that the schema has 
		loaded and we can override the default
		menu.
	--]]
	function PLUGIN:ClockworkSchemaLoaded() 
		include(self:GetBaseDir().."/cl_character.lua");
	end;
end;