local COMMAND = Clockwork.command:New("CreateWaypoint")
COMMAND.tip = "Create a waypoint marker for all Combine units to see."
COMMAND.text = "<string Message>"
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER)
COMMAND.optionalArguments = 1

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		--Uncomment this if statement and customize the line below to your liking if you want the command to be restricted to certain ranks only.
		--if (Schema:IsPlayerCombineRank( player, {"SCN", "DvL", "SeC"} ) or player:GetFaction() == FACTION_OTA) then
		local trace = player:GetEyeTraceNoCursor()
		if (!trace.Hit) then return end

		local strings = {name = player:Name(), msg = table.concat(arguments, " ") or false}
		local transmitstring = util.TableToJSON(strings)
		net.Start("waypointmarker")
			net.WriteVector(trace.HitPos)
			net.WriteString(transmitstring)
		net.Broadcast()

		--else
			--Clockwork.player:Notify(player, "You are not ranked high enough to use this command!")
		--end
	else
		Clockwork.player:Notify(player, "You are not the Combine!")
	end
end

COMMAND:Register()