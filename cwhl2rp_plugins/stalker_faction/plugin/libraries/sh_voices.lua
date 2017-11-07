local PLUGIN = PLUGIN;

PLUGIN.voices = Clockwork.kernel:NewLibrary("StalkerSounds");

PLUGIN.voices.stored = {
	stalkerSounds = {}
};

--Function to add a Stalker Sound.
function PLUGIN.voices:AddStalker(faction, command, phrase, sound, female, menu)
	self.stored.stalkerSounds[#self.stored.stalkerSounds + 1] = {
		command = command,
		faction = faction,
		phrase = phrase,
		female = female,
		sound = sound,
		menu = menu
	};
end;

--Add the voice commands.
PLUGIN.voices:AddStalker("Stalker", "Scream 1", "Waaahhhh!", "npc/stalker/go_alert2.wav");
PLUGIN.voices:AddStalker("Stalker", "Scream 2", "WAAHHHHHHHHHHHHH!", "npc/stalker/go_alert2a.wav");
PLUGIN.voices:AddStalker("Stalker", "Alert 1", "Wuuaahhhch", "npc/stalker/stalker_alert1b.wav");
PLUGIN.voices:AddStalker("Stalker", "Alert 2", "Huaaahhhch", "npc/stalker/stalker_alert2b.wav");
PLUGIN.voices:AddStalker("Stalker", "Alert 3", "Auuuupppch", "npc/stalker/stalker_alert3b.wav");
PLUGIN.voices:AddStalker("Stalker", "Pain 1", "Uaahach", "npc/stalker/stalker_pain1.wav");
PLUGIN.voices:AddStalker("Stalker", "Pain 2", "Ahhhrlaa", "npc/stalker/stalker_pain2.wav");
PLUGIN.voices:AddStalker("Stalker", "Pain 3", "Uaaah", "npc/stalker/stalker_pain3.wav");

if (CLIENT) then
	table.sort(PLUGIN.voices.stored.stalkerSounds, function(a, b) return a.command < b.command; end);
	
	for k, v in pairs(PLUGIN.voices.stored.stalkerSounds) do
		Clockwork.directory:AddCode("Stalker", [[
			<div class="auraInfoTitle">]]..string.upper(v.command)..[[</div>
			<div class="auraInfoText">]]..v.phrase..[[</div>
		]], true);
	end;
end;