local PLUGIN = PLUGIN;

PLUGIN.defaultCharData = [[Age: 00
Gender: ?
Apartment: ?

Other Names:
- None

Additional Info:
- None]];

Clockwork.kernel:IncludePrefixed("sv_plugin.lua");
Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
