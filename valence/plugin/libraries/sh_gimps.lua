local PLUGIN = PLUGIN

PLUGIN.gimps = Clockwork.kernel:NewLibrary("Gimp");
PLUGIN.gimps.stored = {};

function PLUGIN.gimps:Add(text, bShowIsGimp)
	self.stored[#self.stored + 1] = {
		text = text,
		bShowIsGimp = bShowIsGimp
	}
end;

PLUGIN.gimps:Add("lol admin f4 doesnt work", true);
PLUGIN.gimps:Add("lolwat skirt cps", true);
PLUGIN.gimps:Add("hahaha this game sucks", true);
PLUGIN.gimps:Add("!votecop", true);
PLUGIN.gimps:Add("lol how do i talk", true);
PLUGIN.gimps:Add("lelelelele reddit army looooool", true);
PLUGIN.gimps:Add("this srvr suks dik", true);
PLUGIN.gimps:Add("fking admin 2 me", true);
PLUGIN.gimps:Add("server s fking gay cant even punch ppl", true);