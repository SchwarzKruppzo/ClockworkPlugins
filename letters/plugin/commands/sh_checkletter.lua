local COMMAND = Clockwork.command:New("CheckLetter");
COMMAND.tip = "Check your current letter.";

function COMMAND:OnRun(player, arguments)
	if (text[player]) then
		Clockwork.chatBox:SendColored(player, Color(0, 125, 255), text[player].title.." ", Color(125, 255, 255), text[player].content);
	else
		Clockwork.player:Notify(player, "You have no letter to delete.");
	end;
end;

COMMAND:Register();