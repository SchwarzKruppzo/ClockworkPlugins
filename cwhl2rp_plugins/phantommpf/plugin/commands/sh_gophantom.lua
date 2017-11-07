local COMMAND = Clockwork.command:New("GoPHANTOM");
COMMAND.tip = "Enters undercover mode (For PHANTOMs)";
COMMAND.arguments = 0;
function COMMAND:OnRun(player, arguments)
	if(player:GetCharacterData("PHANTOMUndercover") != true) then
		if (Schema:PlayerIsCombine(player)) then
			if(string.find(player:Name(), "PHANTOM")) then
				if(player:GetCharacterData("UndercoverName") and player:GetCharacterData("UndercoverName") != "") then
					player:SetCharacterData("PHANTOMName", player:Name());
					player:SetCharacterData("PHANTOMPhysDesc", player:GetCharacterData("PhysDesc"));
					Clockwork.player:SetName(player, player:GetCharacterData("UndercoverName"));
					player:SetCharacterData("PhysDesc", Clockwork.kernel:ModifyPhysDesc(player:GetCharacterData("UndercoverPhysDesc")));
					player:SetModel(UndercoverModel);
					player:SetCharacterData("customclass", "Citizen");
					player:SetCharacterData("PHANTOMUndercover", true);
					Clockwork.player:Notify(player, "You are now undercover.");
				else
					Clockwork.player:Notify(player, "You need to make a new identity first (/NewPHANTOM)");
				end;
			else
				Clockwork.player:Notify(player, "You are not a PHANTOM!");
			end;
		else
			Clockwork.player:Notify(player, "You are not in the MPF!");
		end;
	else
		Clockwork.player:Notify(player, "You are already undercover.");
	end;
end;
COMMAND:Register()