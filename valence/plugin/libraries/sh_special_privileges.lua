local PLUGIN = PLUGIN

PLUGIN.privileges = Clockwork.kernel:NewLibrary("Privileges");
PLUGIN.privileges.stored = {};

function PLUGIN.privileges:Add(SteamID)
	self.stored[#self.stored + 1] = {
		SteamID = SteamID
	}
end;

PLUGIN.privileges:Add("STEAM_0:0:00000000")