local COMMAND = Clockwork.command:New("DeleteCurrentLetter");
COMMAND.tip = "Allows you to delete your current letter.";

function COMMAND:OnRun(player, arguments)
	if (text[player]) then
		text[player] = nil;

		Clockwork.player:Notify(player, "Letter deleted.");
	else
		Clockwork.player:Notify(player, "You have no letter to delete.");
	end;
end;

COMMAND:Register();