local COMMAND = Clockwork.command:New("MyLetters");
COMMAND.tip = "Allows you to see a list of your letters.";
COMMAND.arguments = 0;

function COMMAND:OnRun(player, arguments)
	local character = player:GetCharacter();
	
	if (letters[character]) then
		local myLetters = letters[character];

		for k, v in pairs(myLetters) do
			Clockwork.chatBox:SendColored(player, Color(0, 125, 255), "ID: "..k..". "..v.sender.." (Title: "..v.title..")");
			Clockwork.chatBox:SendColored(player, Color(0, 125, 255), "Type /readletter <ID> to view the letter's content.");
		end;
	else
		Clockwork.player:Notify(player, "You have no letters.");
	end;
end;

COMMAND:Register();