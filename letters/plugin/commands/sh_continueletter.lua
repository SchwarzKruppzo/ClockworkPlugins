local COMMAND = Clockwork.command:New("ContinueLetter");
COMMAND.tip = "Allows you to continue a letter.";
COMMAND.text = "<string Text>";
COMMAND.arguments = 1;

function COMMAND:OnRun(player, arguments)
	if (!text[player]) then
		Clockwork.player:Notify(player, "You have no letter to continue.");
	else
		local text2 = arguments[1];

		if (text2) then
			if (string.sub(text[player].content, -1) == " ") then
				text[player].content = text[player].content..text2;
			else
				text[player].content = text[player].content.." "..text2;
			end;
			
			Clockwork.player:Notify(player, "Letter continued. Continue it further with /continueletter or send it with /sendletter. Delete it with /deletecurrentletter.");
		end;
	end;
end;

COMMAND:Register();