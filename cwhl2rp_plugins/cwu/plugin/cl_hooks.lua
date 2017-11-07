-- Called when the player info text is needed.
function PLUGIN:GetPlayerInfoText(playerInfoText)
	local citizenID = Clockwork.Client:GetSharedVar("citizenID");
	
	if (citizenID) then
		if (Clockwork.Client:GetFaction() == FACTION_CWU) then
			playerInfoText:Add("CITIZEN_ID", "Citizen ID: #"..citizenID);
		end;
	end;
end;