local COMMAND = Clockwork.command:New("MakeLetter");
COMMAND.tip = "Allows you to make a letter.";
COMMAND.text = "<string Title> <string Text>";
COMMAND.arguments = 2;

function COMMAND:OnRun(player, arguments)
	if (arguments[1]) then
		if (arguments[2]) then
			text[player] = {
				title = arguments[1],
				content = arguments[2]
			};
			
			Clockwork.player:Notify(player, "Letter created. Send it with /sendletter or continue it with /continueletter. Delete it with /deletecurrentletter.");
		else
			Clockwork.player:Notify(player, "You must provide text.");
		end;
	else
		Clockwork.player:Notify(player, "You must specify a title.");
	end;
end;

COMMAND:Register();