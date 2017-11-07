local COMMAND = Clockwork.command:New("SendLetter")
COMMAND.tip = "Sends the letter you made."
COMMAND.text = "<string Name>"
COMMAND.arguments = 1;

function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		if (text[player]) then
			local unread = 0;
			local character = target:GetCharacter();
			
			letters[character] = letters[character] or {};
			letters[character][#letters[character] + 1] = {
				unread = true,
				sender = target:Name(),
				title = text[player].title,
				text = text[player].content
			};

			text[player] = nil;
			
			Clockwork.player:Notify(player, "Letter sent to "..target:Name());
			
			for k, v in pairs(letters[character]) do
				if (v.unread) then
					unread = unread + 1;
				end;
			end;
			
			if (unread != 1) then
				Clockwork.chatBox:SendColored(target, Color(0, 125, 255), "You have "..unread.." unread letters. Type /myletters to view.");
			else
				Clockwork.chatBox:SendColored(target, Color(0, 125, 255), "You have "..unread.." unread letter. Type /myletters to view.");
			end;
		else
			Clockwork.player:Notify(player, "You have no letter to send.");
		end;
	else
		Clockwork.player:Notify(player, "Invalid target.");
	end;
end;

COMMAND:Register();