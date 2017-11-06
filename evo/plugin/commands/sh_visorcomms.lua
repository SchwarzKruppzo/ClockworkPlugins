--[[ 
		Created by Polis, July 2014.
		Do not re-distribute as your own.
]]

/*----------------------\
| Edited by Viomi       |
| viomi@openmailbox.org | // Removed all the god damn semi-colons
\----------------------*/

local COMMAND = Clockwork.command:New("VisorComms")
COMMAND.tip = "Send a notification to other online units via the visor."
COMMAND.text = "<string Text>"
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER)
COMMAND.arguments = 1

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		if (player:GetFaction() == FACTION_OTA or player:GetFaction() == FACTION_ADMIN or player:GetFaction() == FACTION_MPF) then
			local text = table.concat(arguments, " ")
			
			if (text == "") then
				Clockwork.player:Notify(player, "You did not specify enough text!")
				
				return
			end
			
			Schema:AddCombineDisplayLine( "!COMMS: "..player:Name()..": "..text, Color(0, 128, 255, 255) )
			BroadcastLua("LocalPlayer():ConCommand('virgil1')")
		else
			Clockwork.player:Notify(player, "You cannot do this right now!")
		end
	else
		Clockwork.player:Notify(player, "You are not the combine!")
	end
end



COMMAND:Register()