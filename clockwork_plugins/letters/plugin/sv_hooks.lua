function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	local unread = 0;
	local character = player:GetCharacter();
	
	if (letters[character]) then
		for k, v in pairs(letters[character]) do
			if (v.unread) then
				unread = unread + 1;
			end;
		end;
	end;
	
	if (unread != 1) then
		Clockwork.chatBox:SendColored(player, Color(0, 125, 255), "You have "..unread.." unread letters. Type /myletters to view.");
	elseif (unread == 0) then
		Clockwork.chatBox:SendColored(player, Color(0, 125, 255), "You have "..unread.." unread letters.");
	else
		Clockwork.chatBox:SendColored(player, Color(0, 125, 255), "You have "..unread.." unread letter. Type /myletters to view.");
	end;
end;