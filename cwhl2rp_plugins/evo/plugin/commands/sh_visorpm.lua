/*----------------------\
| Created by Viomi      |
| viomi@openmailbox.org |
\----------------------*/

local Clockwork = Clockwork

local COMMAND = Clockwork.command:New("VisorPM")
COMMAND.tip = "Send a private message to a unit using their visor."
COMMAND.text = "<string Name> <string Text>"
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER)
COMMAND.arguments = 2

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1])

	if (Schema:PlayerIsCombine(player)) then
		if (player:GetFaction() == FACTION_OTA or player:GetFaction() == FACTION_ADMIN or player:GetFaction() == FACTION_MPF) then
			local text = table.concat(arguments, " ", 2)
			
			if (text == "") then
				Clockwork.player:Notify(player, "You did not specify enough text!")
				
				return
			end
			
			if (target) then
				Schema:AddCombineDisplayLine( "!RECV: "..player:Name()..": "..text, Color(128, 0, 255, 255), target)
				Schema:AddCombineDisplayLine( "!SEND: "..target:Name()..": "..text, Color(128, 255, 0, 255), player)
				BroadcastLua("LocalPlayer():ConCommand('virgil1')")
			else
				Clockwork.player:Notify(player, arguments[1].." is not a valid unit!")
			end
		else
			Clockwork.player:Notify(player, "You cannot do this right now!")
		end
	else
		Clockwork.player:Notify(player, "You are not the combine!")
	end
end

COMMAND:Register()