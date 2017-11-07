local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local startSounds = {
	"npc/metropolice/vo/on1.wav",
	"npc/metropolice/vo/on2.wav"
};

local endSounds = {
	"npc/metropolice/vo/off1.wav",
	"npc/metropolice/vo/off2.wav",
	"npc/metropolice/vo/off3.wav",
	"npc/metropolice/vo/off4.wav"
};

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	Clockwork.kernel:CreateTimer("better_vocoders", 0.4, -1, function()
		local faction = Clockwork.faction.stored["Metropolice Force"];

		if (faction) then
			faction.startChatNoise = startSounds[math.random( #startSounds )];
			faction.endChatNoise = endSounds[math.random( #endSounds )];
		end;
	end);
end;