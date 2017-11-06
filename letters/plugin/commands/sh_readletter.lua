local COMMAND = Clockwork.command:New("ReadLetter");
COMMAND.tip = "Allows you to read a letter you received.";
COMMAND.text = "<string ID>";
COMMAND.arguments = 1;

function COMMAND:OnRun(player, arguments)
	local ID = tonumber(arguments[1]);
	local character = player:GetCharacter();
	
	if (letters[character] and ID and letters[character][ID]) then
		local letter = letters[character][ID];

		Clockwork.chatBox:SendColored(player, Color(0, 125, 255), letter.sender.." ("..letter.title..")");
		Clockwork.chatBox:SendColored(player, Color(125, 255, 255), letter.text);
		
		letters[character][ID].unread = false;
	else
		Clockwork.player:Notify(player, "Invalid letter.");
	end;
end;

COMMAND:Register();