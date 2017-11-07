local PLUGIN = PLUGIN;

-- Called when a player starts typing.
concommand.Add("cwSpeechText", function(player, command, arguments)
	if (player:Alive() and !player:IsRagdolled(RAGDOLL_FALLENOVER)) then
		if (arguments and arguments[1]) then
			hook.Call("PlayerStartTypingDisplay", Clockwork, player, arguments[1]);
			if (arguments[1] == "Y1Y2SSQ4Q6Y5") then
				player:SetSharedVar("SpeechText", nil)
			else
				player:SetSharedVar("SpeechText", arguments[1])
			end;
		end;
	end;
end);