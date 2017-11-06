local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called after a player has been drawn.
function PLUGIN:PostPlayerDraw(player)
	local large3D2DFont = Clockwork.option:GetFont("large_3d_2d");
	local colorWhite = Clockwork.option:GetColor("white");
	local eyeAngles = Clockwork.Client:EyeAngles();
	local typing = player:GetSharedVar("Typing");
	
	
	--If OOC or /me or not typing
	if (typing == 0 or typing == 5 or typing == 1) then return; end;
	
	local fadeDistance = Clockwork.config:Get("talk_radius"):Get();
	
	if (typing == 2) then
		fadeDistance = Clockwork.config:Get("talk_radius"):Get() * 2;
	elseif (typing == 6) then
		fadeDistance = Clockwork.config:Get("talk_radius"):Get() / 3;		
	end;	
	
	if ((player:GetPos() and Clockwork.Client:GetPos())
	and player:GetPos():Distance(Clockwork.Client:GetPos()) > fadeDistance) then
		return;
	end;
		
	if (!player:Alive() or player:IsRagdolled(RAGDOLL_FALLENOVER)) then
		return;
	end;
		
	if (!player:InVehicle() and player:GetMoveType() == MOVETYPE_NOCLIP) then
		return;
	end;

	local color = player:GetColor();	
	local curTime = UnPredictedCurTime();
	
	if (player:GetMaterial() != "sprites/heatwave" and a != 0) then
		local alpha = Clockwork.kernel:CalculateAlphaFromDistance(fadeDistance, Clockwork.Client, player);
		local position = Clockwork.plugin:Call("GetPlayerTypingDisplayPosition", player);
		local headBone = "ValveBiped.Bip01_Head1";
			
		if (string.find(player:GetModel(), "vortigaunt")) then
			headBone = "ValveBiped.Head";
		end;
			
		if (!position) then
			local bonePosition = nil;
				
			if (player:InVehicle()) then
				local physBone = player:LookupBone(headBone);
			
				if (physBone) then
					bonePosition = player:GetBonePosition(physBone);
						
					if (!bonePosition) then
						position = player:GetPos() + Vector(0, 0, 132);
					end;
				end;
			elseif (player:IsRagdolled()) then
				local entity = player:GetRagdollEntity();
					
				if (IsValid(entity)) then
					local physBone = entity:LookupBone(headBone);
					
					if (physBone) then
						bonePosition = entity:GetBonePosition(physBone);
							
						if (!bonePosition) then
							position = player:GetPos() + Vector(0, 0, 20);
						end;
					end;
				end;
			elseif (player:Crouching()) then
				local physBone = player:LookupBone(headBone);
				
				if (physBone) then
					bonePosition = player:GetBonePosition(physBone);
					
					if (!bonePosition) then
						position = player:GetPos() + Vector(0, 0, 68);
					end;
				end;
			else
				local physBone = player:LookupBone(headBone);
				
				if (physBone) then
					bonePosition = player:GetBonePosition(physBone);
						
					if (!bonePosition) then
						position = player:GetPos() + Vector(0, 0, 84);
					end;
				end;
			end;
				
			if (bonePosition) then
				position = bonePosition + Vector(0, 0, 20);
			end;
		end;
			 
		if (position) then
				
			position = position + eyeAngles:Up();
			eyeAngles:RotateAroundAxis(eyeAngles:Forward(), 90);
			eyeAngles:RotateAroundAxis(eyeAngles:Right(), 90);			
			drawText = player:GetSharedVar("SpeechText");	
				
			if (drawText != "") then
				local prefix = Clockwork.config:Get("command_prefix"):Get();
				
				if (string.sub(drawText, 1, string.len(prefix) + 2) == prefix.."w ") then
					drawText = "[Whisper] \""..drawText.."\""
				elseif (string.sub(drawText, 1, string.len(prefix) + 2) == prefix.."y ") then
					drawText = "[Yell] \""..drawText.."\""
				end;
			
				local textWidth, textHeight = Clockwork.kernel:GetCachedTextSize(Clockwork.option:GetFont("main_text"), drawText);
					
				if (textWidth and textHeight) then
					cam.Start3D2D(position, Angle(0, eyeAngles.y, 90), 0.04);
						Clockwork.kernel:OverrideMainFont(large3D2DFont);
							Clockwork.kernel:DrawInfo(drawText, 0, 0, colorWhite, alpha, nil, nil, 4);
						Clockwork.kernel:OverrideMainFont(false);
					cam.End3D2D();
				end;
			end;
		end;
	end;
end;

-- Called when the chat box text has changed.
function cwDisplayTyping:ChatBoxTextChanged(previousText, newText)
	local prefix = Clockwork.config:Get("command_prefix"):Get();
	
	if (string.sub(newText, 1, string.len(prefix) + 6) == prefix.."radio ") then
		if (string.sub(previousText, 1, string.len(prefix) + 6) != prefix.."radio ") then
			RunConsoleCommand("cwTypingStart", "r");
		end;
	elseif (string.sub(newText, 1, string.len(prefix) + 3) == prefix.."me ") then
		if (string.sub(previousText, 1, string.len(prefix) + 3) != prefix.."me ") then
			RunConsoleCommand("cwTypingStart", "p");
		end;
	elseif (string.sub(newText, 1, string.len(prefix) + 3) == prefix.."pm ") then
		if (string.sub(previousText, 1, string.len(prefix) + 3) != prefix.."pm ") then
			RunConsoleCommand("cwTypingStart", "o");
		end;
	elseif (string.sub(newText, 1, string.len(prefix) + 2) == prefix.."w ") then
		if (string.sub(previousText, 1, string.len(prefix) + 2) != prefix.."w ") then
			RunConsoleCommand("cwTypingStart", "w");
		end;
	elseif (string.sub(newText, 1, string.len(prefix) + 3) == prefix.."rw ") then
		if (string.sub(previousText, 1, string.len(prefix) + 3) != prefix.."rw ") then
			RunConsoleCommand("cwTypingStart", "w");
		end;
	elseif (string.sub(newText, 1, string.len(prefix) + 2) == prefix.."r ") then
		if (string.sub(previousText, 1, string.len(prefix) + 2) != prefix.."r ") then
			RunConsoleCommand("cwTypingStart", "r");
		end;
	elseif (string.sub(newText, 1, string.len(prefix) + 2) == prefix.."y ") then
		if (string.sub(previousText, 1, string.len(prefix) + 2) != prefix.."y ") then
			RunConsoleCommand("cwTypingStart", "y");
		end;
	elseif (string.sub(newText, 1, string.len(prefix) + 3) == prefix.."op ") then
		if (string.sub(previousText, 1, string.len(prefix) + 3) != prefix.."op ") then
			RunConsoleCommand("cwTypingStart", "o");
		end;
	elseif (string.sub(newText, 1, string.len(prefix) + 3) == prefix.."ad ") then
		if (string.sub(previousText, 1, string.len(prefix) + 3) != prefix.."ad ") then
			RunConsoleCommand("cwTypingStart", "o");
		end;
	elseif (string.sub(newText, 1, string.len(prefix) + 3) == prefix.."su ") then
		if (string.sub(previousText, 1, string.len(prefix) + 3) != prefix.."su ") then
			RunConsoleCommand("cwTypingStart", "o");
		end;
	elseif (string.sub(newText, 1, string.len(prefix) + 4) == prefix.."rad ") then
		if (string.sub(previousText, 1, string.len(prefix) + 4) != prefix.."rad ") then
			RunConsoleCommand("cwTypingStart", "o");
		end;	
	elseif (string.sub(newText, 1, 2) == "// ") then
		if (string.sub(previousText, 1, 2) != prefix.."//") then
			RunConsoleCommand("cwTypingStart", "o");
		end;
	elseif (string.sub(newText, 1, 3) == ".// ") then
		if (string.sub(previousText, 1, 3) != prefix..".//") then
			RunConsoleCommand("cwTypingStart", "o");
		end;
	elseif (string.len(newText) >= 4 and string.len(previousText) < 4) then
		RunConsoleCommand("cwTypingStart", "n");
	end;
end;

-- Called when the chat box is closed.
function PLUGIN:ChatBoxClosed(textTyped)
	RunConsoleCommand("cwSpeechText", "Y1Y2SSQ4Q6Y5")
end;

-- Called when the chat box text has changed.
function PLUGIN:ChatBoxTextChanged(previousText, newText)
	local prefix = Clockwork.config:Get("command_prefix"):Get();
	local typing = Clockwork.Client:GetSharedVar("Typing");
	
	RunConsoleCommand("cwSpeechText", newText)
end;