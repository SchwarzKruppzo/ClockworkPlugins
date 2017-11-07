--[[ 
		Created by Polis, July 2014.
		Do not re-distribute as your own.
]]

local COMMAND = Clockwork.command:FindByID("broadcast")

function COMMAND:OnRun(player, arguments)
	if (player:GetFaction() == FACTION_ADMIN) then
		local text = table.concat(arguments, " ");
		
		if (text == "") then
			Clockwork.player:Notify(player, "You did not specify enough text!");
			
			return;
		end;
		
		Schema:SayBroadcast(player, text);
		Schema:AddCombineDisplayLine("!BROADCAST: "..text, Color(212,111, 249, 255) );
	else
		Clockwork.player:Notify(player, "You are not a City Administrator!");
	end;
end;

COMMAND:Register();