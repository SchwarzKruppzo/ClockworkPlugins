Clockwork.kernel:IncludePrefixed("sv_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

if (SERVER) then
	Clockwork.config:Add("clockmos_sync", true);
	Clockwork.config:Add("clockmos_cloudfix", true);
else
	Clockwork.config:AddToSystem("Enable Atmos/Clockwork Sync", "clockmos_sync", "Whether or not the Atmos day/night cycle should forcefully be synced to the Clockwork time.", true);
	Clockwork.config:AddToSystem("Enable Atmos Stormcloud Fix", "clockmos_cloudfix", "Whether or not to stop stormclouds from disappearing while it's still raining.", true);
end;
