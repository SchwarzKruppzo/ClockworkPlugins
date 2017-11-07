local COMMAND = Clockwork.command:New("DeleteLetter");
COMMAND.tip = "Allows you to delete a letter you've received.";
COMMAND.text = "<string ID>";
COMMAND.arguments = 1;

function COMMAND:OnRun(player, arguments)
	local ID = tonumber(arguments[1]);
	local character = player:GetCharacter();
	
	if (ID and letters[character] and letters[character][ID]) then
		if (#letters[character] == 1) then
			letters[character] = nil;
		else
			letters[character][ID] = nil;
		end;
		
		Clockwork.player:Notify(player, "Letter deleted.");
	else
		Clockwork.player:Notify(player, "Invalid ID.");
	end;
end;

COMMAND:Register();