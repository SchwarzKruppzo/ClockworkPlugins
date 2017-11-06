/*----------------------\
| Created by Viomi      |
| viomi@openmailbox.org |
\----------------------*/

local COMMAND = Clockwork.command:New("Dispatch")
COMMAND.tip = "Dispatch a message to all characters."
COMMAND.text = "<string Text>"
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER)
COMMAND.arguments = 1

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		if (Schema:IsPlayerCombineRank( player, {ranks["divisionleader"], nranks["sectorial"], nranks["commander"], nranks["AI"]} ) or player:GetFaction() == FACTION_OTA) then
			local text = table.concat(arguments, " ")
			
			if (text == "") then
				Clockwork.player:Notify(player, "You did not specify enough text!")
				
				return
			end
			
			Schema:SayDispatch(player, text)
		else
			Clockwork.player:Notify(player, "You are not ranked high enough to use this command!")
		end
	else
		Clockwork.player:Notify(player, "You are not the Combine!")
	end
end

COMMAND:Register()