local PLUGIN = PLUGIN;

Clockwork.kernel:IncludePrefixed("sv_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");


function PLUGIN:IsStalkerFaction(faction)
	return (faction == FACTION_STALKER);
end;