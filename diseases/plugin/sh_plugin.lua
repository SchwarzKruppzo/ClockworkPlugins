local playerMeta = FindMetaTable("Player");

PLUGIN:SetGlobalAlias("cwDiseases");
PLUGIN.version = "r8"

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

-- Called when the schema has been loaded.
function PLUGIN:ClockworkSchemaLoaded()
	for k, v in pairs(Clockwork.plugin.stored) do
		if (!Clockwork.plugin:IsDisabled(v.name) and !Clockwork.plugin:IsUnloaded(v.name)) then
			local pluginDirectory = v:GetBaseDir().."/diseases/";

			Clockwork.kernel:IncludeDirectory(pluginDirectory);
		end;
	end;
end;

if SERVER then

function PLUGIN:CheckVersion()
	MsgC(Color(46, 204, 113), "-> The diseases plugin has been initialized.\n");
	MsgC(Color(236, 240, 241), "-> Version: "..self.version.."\n");
	MsgC(Color(236, 240, 241), "-> Checking if the plugin is up to date...\n");
	http.Fetch("https://dl.dropbox.com/s/tj75dyfirq0v8sx/clockwork_plugins_tracker.txt", function(body)
		local info = string.Explode("\n", body);
		local versions = {};
		for k,v in pairs(info) do
			local version_info = string.Explode(": ", v);
			versions[version_info[1]] = version_info[2];
		end

		if versions["cwDiseases"] then
			if versions["cwDiseases"] == self.version then
				MsgC(Color(46, 204, 113), "-> The diseases plugin is up to date!\n");
			else
				MsgC(Color(231, 76, 60), "! Diseases is out of date!\n");
				MsgC(Color(236, 240, 241), "-> Current version: "..self.version.."\n");
				MsgC(Color(236, 240, 241), "-> Newest version: "..versions["cwDiseases"].."\n");
			end
		else
			MsgC(Color(231, 76, 60), "! Failed to fetch release information!\n");
		end
	end, function()
		MsgC(Color(231, 76, 60), "! Failed to fetch version tracker!\n");
	end);
end;

function PLUGIN:Initialize()
	self:CheckVersion();
end;

end

if (SERVER) then
	Clockwork.config:Add("diseases_enabled", true);
	Clockwork.config:Add("diseases_temporary_min", 1);
	Clockwork.config:Add("diseases_temporary_max", 2);
	Clockwork.config:Add("diseases_contact_radius", 64);
	Clockwork.config:Add("diseases_base_infection_chance", 30);
	Clockwork.config:Add("diseases_contact_infect_interval", 10);
	Clockwork.config:Add("diseases_contact_time_limit", 1);
	Clockwork.config:Add("diseases_airborne_infect_interval", 30);
	Clockwork.config:Add("diseases_lethality_override", false);
	Clockwork.config:Add("diseases_lethaltiy_interval", 15);
	Clockwork.config:Add("diseases_sick_time_min", 2);
	Clockwork.config:Add("diseases_sick_time_max", 4);
else
	Clockwork.config:AddToSystem("Enable diseases", "diseases_enabled", "Whether or not the diseases system should be enabled.", true);
	Clockwork.config:AddToSystem("Disease temporary effect minimum", "diseases_temporary_min", "The minimum amount of time in minutes before a temporary effect occurs.", 1, 9);
	Clockwork.config:AddToSystem("Disease temporary effect maximum", "diseases_temporary_max", "The maximum amount of time in minutes before a temporary effect occurs.", 2, 10);
	Clockwork.config:AddToSystem("Disease contact radius", "diseases_contact_radius", "The distance someone has to be to a player for it to be considered contact.", 64, 128);
	Clockwork.config:AddToSystem("Base infection chance", "diseases_base_infection_chance", "The base infection chance.", 0, 70);
	Clockwork.config:AddToSystem("Contact infection interval", "diseases_contact_infect_interval", "The approximate interval in minutes between each chance of being infected by contact.", 10, 120);
	Clockwork.config:AddToSystem("Contact time limit", "diseases_contact_time_limit", "How long - in minutes - you have to stand near someone infected until it counts as contact.", 2, 20);
	Clockwork.config:AddToSystem("Airborne infection interval", "diseases_airborne_infect_interval", "The approximate interval in minutes between each chance of being infected through the air.", 30, 120);
	Clockwork.config:AddToSystem("Override disease lethality", "diseases_lethality_override", "Whether or not to override automatic handling of disease lethality", false);
	Clockwork.config:AddToSystem("Disease lethality effect interval", "diseases_lethality_interval", "The interval in minutes between a disease's lethality affecting someone.", 15, 30);
	Clockwork.config:AddToSystem("Sick time minimum", "diseases_sick_time_min", "The minimum time in hours before a disease wears off.", 2, 10);
	Clockwork.config:AddToSystem("Sick time maximum", "diseases_sick_time_max", "The maximum time in hours before a disease wears off.", 4, 20);
end;

