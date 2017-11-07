local PLUGIN = PLUGIN;

-- Called when a player's typing display has started.
function PLUGIN:PlayerStartTypingDisplay(player, code)
	if (player:HasItemByID("handheld_radio") and !player:IsNoClipping()) then
		if (code == "r") then
			if (!player.typingBeep) then
				player.typingBeep = true;
				
				player:EmitSound("npc/overwatch/radiovoice/on1.wav");
			end;
		end;
	end;
end;

-- Called when a player's typing display has finished.
function PLUGIN:PlayerFinishTypingDisplay(player, textTyped)
	if (player:HasItemByID("handheld_radio") and textTyped) then
		if (player.typingBeep) then
			player:EmitSound("npc/overwatch/radiovoice/off4.wav");
		end;
	end;
	
	player.typingBeep = nil;
end;