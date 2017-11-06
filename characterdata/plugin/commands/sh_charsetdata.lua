local COMMAND = Clockwork.command:New("CharSetData");
COMMAND.tip = "Set a character's data.";
COMMAND.arguments = 3;
COMMAND.text = "<string PlayerName> <string DataName> <string Data>";
COMMAND.access = "s"
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	if(target) then
		target:SetCharacterData(arguments[2], arguments[3])
		Clockwork.player:Notify(player, arguments[1].."'s data for: "..arguments[2].." has been set to: "..arguments[2])
	else
		Clockwork.player:Notify(player, "Invalid target.")
	end
end
COMMAND:Register()