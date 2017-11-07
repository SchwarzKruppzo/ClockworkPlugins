local PLUGIN = PLUGIN;

Clockwork.config:AddToSystem("Enable OOC", "enable_ooc", "If players can use OOC chat.", true);
Clockwork.config:AddToSystem("Staff can Always Use OOC", "admin_super_ooc", "If admins can always use OOC.", true);
Clockwork.config:AddToSystem("Staff must respect OOC Interval", "staff_respect_interval", "If staff still needs to respect OOC Interval.", true);
Clockwork.config:AddToSystem("Operators can Always Use OOC Too", "operator_super_ooc", "If operators can always use OOC, too.\nRemember that this won't work if 'Staff can Always Use OOC' is disabled.'", true);
Clockwork.config:AddToSystem("Admin interval", "admin_interval", "How long does it have to pass before a person can report again.", 20);
Clockwork.config:AddToSystem("Admin Echoes", "admin_echoes", "Do admin commands notify the server that they have been ran?", true);
Clockwork.config:AddToSystem("Re-enable OOC on startup", "ooc_enable", "If OOC will be re-enabled on restarts.\n(Better leave it on, in case server crashes and no admin gets back on to re-enable OOC)\nAlthough if you want to disable OOC for players, you can disable this.", true);

function PLUGIN:GetClientTempFlags()
	if (Clockwork.Client:GetSharedVar("tempFlags")) then
		return util.JSONToTable(Clockwork.Client:GetSharedVar("tempFlags"));
	else
		return {};
	end;
end;