local COMMAND = Clockwork.command:FindByID("Request");

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local faction = player:GetFaction();
	local isCityAdmin = (player:GetFaction() == FACTION_ADMIN);
	local text = table.concat(arguments, " ");
	
	if (text == "") then
		Clockwork.player:Notify(player, "You did not specify enough text!");
		
		return;
	end;
	
	if (player:HasItemByID("request_device") or faction == "Metropolice Force" or faction == "Overwatch Transhuman Arm" or isCityAdmin) then
		local curTime = CurTime();
		
		if (!player.nextRequestTime or isCityAdmin or faction == "Metropolice Force" or faction == "Overwatch Transhuman Arm" or curTime >= player.nextRequestTime) then
			Schema:SayRequest(player, text);
			
			if (!isCityAdmin and !faction == "Metropolice Force" and !faction == "Overwatch Transhuman Arm") then
				player.nextRequestTime = curTime + 30;
		
				local strings = {name = player:Name(), msg = false}
				local location = player:GetPos()
				local transmitstring = util.TableToJSON(strings)
				net.Start("requestmarker")
					net.WriteVector(location)
					net.WriteString(transmitstring)
				net.Broadcast()
			end;
		else
			Clockwork.player:Notify(player, "You cannot send a request for another "..math.ceil(player.nextRequestTime - curTime).." second(s)!");
		end;
	else
		Clockwork.player:Notify(player, "You do not own a request device!");
	end;
end;