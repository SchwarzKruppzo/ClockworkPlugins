local PLUGIN = PLUGIN

function PLUGIN:ChatBoxAdjustInfo(info)
	local playerIsCombine = Schema:PlayerIsCombine(info.speaker)
	local CT = CurTime()
	if info.class == "ic" or info.class == "yell" or info.class == "radio" or info.class == "whisper" or info.class == "request" then
		if string.match(info.text, "|") then
			local textParts = string.Explode("|", info.text)
			local piecedText = ""
			local previousSound = ""
			local prevSoundDur = 0
			local nextSoundTime = 0
			local addToNextSoundTime = 0
			local speakVolume = 80
			local voiceCommandQueue = {}

			if info.class == "yell" then speakVolume = 95; yell = true elseif info.class == "whisper" then speakVolume = 65 end

			hook.Add("Think", info.speaker:Name().."VoiceCommandCTUpdate", function() CT = CurTime() end)

			for k,v in pairs(textParts) do
				if v == "" then
					addToNextSoundTime = addToNextSoundTime + 0.2
				end

				for k2, v2 in pairs(Schema.voices.stored.normalVoices) do
					if (v2.faction == "Combine" and playerIsCombine) or (v2.faction == "Human" and !playerIsCombine) then
						if string.lower(v) == string.lower(v2.command) then
							prevSoundDur = prevSoundDur + SoundDuration(previousSound)
							if k >= 2 then prevSoundDur = prevSoundDur + 0.2 end
							if k == 1 then
								nextSoundTime = 0
							else
								nextSoundTime = CT + prevSoundDur + 0.2 + addToNextSoundTime
							end
							previousSound = v2.sound
							voiceCommandQueue[#voiceCommandQueue+1] = {
								phrase = v2.phrase,
								sound = v2.sound,
								time = nextSoundTime
							}
							if k != #textParts then
								piecedText = piecedText..v2.phrase.." "
							else
								piecedText = piecedText..v2.phrase
							end
						end
					end
				end
			end

			for k,v in pairs(voiceCommandQueue) do
				timer.Create(info.speaker:Name().."DoVoiceCommandQueue"..k, 0.1, 0, function()
					if CT > v.time then
						info.speaker:EmitSound(v.sound, speakVolume)
						if info.class == "radio" or info.class == "request" then
							for k2,v2 in pairs(info.listeners) do
								if v2:GetPos():Distance(info.speaker:GetPos()) > Clockwork.config:Get("talk_radius"):Get() then
									Clockwork.player:PlaySound(v2, v.sound)
								end
							end
						end
						timer.Destroy(info.speaker:Name().."DoVoiceCommandQueue"..k)
					end
				end)
			end

			if piecedText:sub(#piecedText) == " " then piecedText = piecedText:sub(1,#piecedText-1) end

			if piecedText != "" then
				info.text = piecedText
			end
		end
	end
end