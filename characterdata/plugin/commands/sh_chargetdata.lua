local COMMAND = Clockwork.command:New("CharGetData");
COMMAND.tip = "Get a character's data.";
COMMAND.arguments = 1;
COMMAND.text = "<string PlayerName> <string DataName>";
COMMAND.access = "s"
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	if(target) then
		Clockwork.player:Notify(target, tostring(player:GetCharacterData(arguments[1])))
	else
		Clockwork.player:Notify(player, "Invalid target.")
	end
end
COMMAND:Register()