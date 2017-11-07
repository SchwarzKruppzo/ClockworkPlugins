local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local startSounds = {
	"npc/overwatch/radiovoice/on1.wav",
	"npc/overwatch/radiovoice/on3.wav",
	"npc/metropolice/vo/on2.wav"
};

local endSounds = {
	"npc/metropolice/vo/off1.wav",
	"npc/metropolice/vo/off2.wav",
	"npc/metropolice/vo/off3.wav",
	"npc/metropolice/vo/off4.wav",
	"npc/overwatch/radiovoice/off2.wav",
	"npc/overwatch/radiovoice/off2.wav"
};

local commaFile = "npc/overwatch/radiovoice/_comma.wav";

--[[
stages:
0-start sound
1-attention...
2-[charges]
3-judged guilty...
4-stop sound
]]
local function DispChargesContinue(player, stage, chargesLeft)
	if (!IsValid(player) or !Schema:PlayerIsCombine(player)) then
		return;
	end;

	local sound;
	local waitTime;

	if (stage < 1) then
		sound = startSounds[math.random( #startSounds )];
		waitTime = SoundDuration(sound);

		stage = stage + 1;
	elseif (stage == 1) then
		sound = "npc/overwatch/radiovoice/attentionyouhavebeenchargedwith.wav";
		waitTime = SoundDuration(sound) + SoundDuration(commaFile);

		stage = stage + 1;
	elseif (stage == 2) then
		local chargeNum = chargesLeft[1];

		if PLUGIN.chargesData[chargeNum] then
			sound = PLUGIN.chargesData[chargeNum][1];
			waitTime = SoundDuration(sound) + SoundDuration(commaFile);
		else
			-- Invalid charge somehow.
			SoundDuration(commaFile);
		end;

		table.remove(chargesLeft, 1);
		if (#chargesLeft < 1) then
			stage = stage + 1;
		end;
	elseif (stage == 3) then
		sound = "npc/overwatch/radiovoice/youarejudgedguilty.wav";
		waitTime = SoundDuration(sound);

		stage = stage + 1;
	else
		sound = endSounds[math.random( #endSounds )];
	end;

	if (sound) then
		player:EmitSound(sound);
	end;

	if (waitTime) then
		timer.Simple(waitTime, function()
			DispChargesContinue(player, stage, chargesLeft);
		end);
	end;
end;

Clockwork.datastream:Hook("DispCharges", function(player, data)
	if (Schema:PlayerIsCombine(player) and type(data[1]) == "table") then
		if (#data[1] < 1) then
			Clockwork.player:Notify(player, "You haven't checked any charges!");
		else
			local sentence = "Attention, you have been charged with: ";

			for i, chargeNum in ipairs(data[1]) do
				if PLUGIN.chargesData[chargeNum] then
					sentence = sentence .. PLUGIN.chargesData[chargeNum][2] .. (i == #data[1] and "." or ";") .. " ";
				end;
			end;

			sentence = sentence .. "You are judged guilty by civil protection teams.";

			DispChargesContinue(player, 0, data[1]);
			Clockwork.chatBox:AddInRadius(player, "ic", sentence, player:GetPos(), Clockwork.config:Get("talk_radius"):Get());
		end;
	end;
end)
