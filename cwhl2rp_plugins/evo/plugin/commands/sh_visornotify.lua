--[[ 
		Created by Polis, July 2014.
		Do not re-distribute as your own.
]]

local COMMAND = Clockwork.command:New("VisorNotify");
COMMAND.tip = "Notify other units of your '10-' status via the visor.";
COMMAND.text = "<string 10-8/10-7>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER);
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
			local text = table.concat(arguments, " ");
			
			if (text == "10-8") then
				Schema:AddCombineDisplayLine( "!NOTIF: "..player:Name().." is now 10-8, requesting status report.", Color(20, 255, 20, 255) );
				BroadcastLua("LocalPlayer():ConCommand('virgil1')")

			elseif (text == "10-7") then
				Schema:AddCombineDisplayLine( "!NOTIF: "..player:Name().." is now 10-7.", Color(80, 150, 20, 255) );
				BroadcastLua("LocalPlayer():ConCommand('virgil2')")
				
			else
				Clockwork.player:Notify(player, "That is not a valid '10-' string!");
				
			end;
			
	else
		Clockwork.player:Notify(player, "You are not the Combine!");
	end;
end;



COMMAND:Register();