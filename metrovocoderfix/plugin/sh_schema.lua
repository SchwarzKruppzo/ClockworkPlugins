/*--------------------------------------------------------------------------\
| THIS ENTIRE PLUGIN IS CREATED BY VIOMI                                    |
| PLEASE DO NOT COPY OR SELL ANY CODE IN HERE WITHOUT PERMISSION FROM VIOMI |
| Contact: viomi@openmailbox.org                                            |
\--------------------------------------------------------------------------*/

function Schema:ChatBoxAdjustInfo(info)
	if (info.class != "ooc" and info.class != "looc") then
		if (IsValid(info.speaker) and info.speaker:HasInitialized()) then
			if (string.sub(info.text, 1, 1) == "?") then
				info.text = string.sub(info.text, 2);
				info.data.anon = true;
			end;
		end;
	end;
	
	if (info.class == "ic" or info.class == "yell" or info.class == "radio" or info.class == "whisper" or info.class == "request") then
		if (IsValid(info.speaker) and info.speaker:HasInitialized()) then
			local playerIsCombine = self:PlayerIsCombine(info.speaker);
			
			if (playerIsCombine and self:IsPlayerCombineRank(info.speaker, "SCN")) then
				for k, v in pairs(self.voices.stored.dispatchVoices) do
					if (string.lower(info.text) == string.lower(v.command)) then
						local voice = {
							global = false,
							volume = 90,
							sound = v.sound
						};
						
						if (info.class == "request" or info.class == "radio") then
							voice.global = true;
						elseif (info.class == "whisper") then
							voice.volume = 80;
						elseif (info.class == "yell") then
							voice.volume = 100;
						end;
						
						info.text = "<:: "..v.phrase.." ::>";
						info.voice = voice;
						
						return true;
					end;
				end;
			else
				for k, v in pairs(self.voices.stored.normalVoices) do
					if ((v.faction == "Combine" and playerIsCombine) or (v.faction == "Human" and !playerIsCombine)) then
						if (string.lower(info.text) == string.lower(v.command)) then
							local voice = {
								global = false,
								volume = 80,
								sound = v.sound
							};
							
							if (v.female and info.speaker:QueryCharacter("gender") == GENDER_FEMALE) then
								voice.sound = string.Replace(voice.sound, "/male", "/female");
							end;
							
							if (info.class == "request" or info.class == "radio") then
								voice.global = true;
							elseif (info.class == "whisper") then
								voice.volume = 60;
							elseif (info.class == "yell") then
								voice.volume = 100;
							end;
							
							if (playerIsCombine) then
								info.text = "<:: "..v.phrase.." ::>";
							else
								info.text = v.phrase;
							end;
							
							info.voice = voice;
							
							return true;
						end;
					end;
				end;
			end;
			
			if (playerIsCombine) then
				if (string.sub(info.text, 1, 4) != "<:: ") then
					info.text = "<:: "..info.text.." ::>";
				end;
			end;
		end;
	elseif (info.class == "dispatch") then
		for k, v in pairs(self.voices.stored.dispatchVoices) do
			if (string.lower(info.text) == string.lower(v.command)) then
				Clockwork.player:PlaySound(nil, v.sound);
				
				info.text = v.phrase;
				
				return true;
			end;
		end;
	end;
end;