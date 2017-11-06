local COMMAND = Clockwork.command:New("UnPHANTOM");
COMMAND.tip = "Exits undercover mode (For PHANTOMs)";
COMMAND.arguments = 0;
function COMMAND:OnRun(player, arguments)
	if(player:GetCharacterData("PHANTOMUndercover") == true) then
		if(string.find(player:GetCharacterData("PHANTOMName"), "PHANTOM")) then
			Clockwork.player:SetName(player, player:GetCharacterData("PHANTOMName"));
			player:SetCharacterData("PhysDesc", Clockwork.kernel:ModifyPhysDesc(player:GetCharacterData("PHANTOMPhysDesc")));
			player:SetCharacterData("customclass", "High Command");
			player:SetModel(PHANTOMModel);
			player:SetCharacterData("PHANTOMUndercover", false);
			Clockwork.player:Notify(player, "You are no longer undercover.");
		else
			Clockwork.player:Notify(player, "You are not a PHANTOM!");
		end;
	else
		Clockwork.player:Notify(player, "You are not undercover.");
	end;
end
COMMAND:Register()