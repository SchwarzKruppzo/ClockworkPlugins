local COMMAND = Clockwork.command:New("CloseCombineDoors");
COMMAND.tip = "Close all Combine doors.";
COMMAND.text = "<string Text>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER);
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		if (Schema:IsPlayerCombineRank( player, {"SCN", "DvL", "SeC"} ) or player:GetFaction() == FACTION_OTA) then
			for k, v in pairs(ents.GetAll()) do
		        if (v:GetClass() == "func_door" or v:GetClass() == "func_door_rotating") then
			        v:Fire("Close","",0)
		        end
	        end
			Clockwork.player:Notify(player, "Closed all Combine doors.");
		else
			Clockwork.player:Notify(player, "You are not ranked high enough to use this command!");
		end;
	else
		Clockwork.player:Notify(player, "You are not the Combine!");
	end;
end;

COMMAND:Register();