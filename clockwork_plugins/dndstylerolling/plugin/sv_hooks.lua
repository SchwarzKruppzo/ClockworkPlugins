function PLUGIN:ClockworkInitialized()
	local COMMAND = Clockwork.command:FindByID("Roll")
	COMMAND.tip = "Testing command."
	COMMAND.text = "<none>"

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local number = math.Clamp(math.floor(tonumber(20)), 1, 20)
		local roll = math.random(1, number)
		local atbs = math.floor(Clockwork.attributes:Fraction(player, ATB_STRENGTH, 100, 0)) / 5
		local atba = math.floor(Clockwork.attributes:Fraction(player, ATB_ACROBATICS, 100, 0)) / 5
		local atbm = math.floor(Clockwork.attributes:Fraction(player, ATB_MEDICAL, 100, 0)) / 5
		local atbg = math.floor(Clockwork.attributes:Fraction(player, ATB_AGILITY, 100, 0)) / 5
		local atbe = math.floor(Clockwork.attributes:Fraction(player, ATB_ENDURANCE, 100, 0)) / 5
		local atbd = math.floor(Clockwork.attributes:Fraction(player, ATB_DEXTERITY, 100, 0)) / 5

		if arguments[1] then
			if string.lower(arguments[1]) == "acrobatics" then
				Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name() .. " has rolled an Acrobatics d20, they rolled " .. roll .. " out of " .. number .. "! Adding " .. math.Round(atba) .. " from their attribute roll, the total is " .. roll + math.Round(atba))
				Clockwork.chatBox:AddInRadius(player, "roll", " has rolled an Acrobatics d20, they rolled " .. roll .. " out of " .. number .. " Adding " .. math.Round(atba) .. " from their attribute roll, the total is " .. roll + math.Round(atba) .. "!", player:GetPos(), Clockwork.config:Get("talk_radius"):Get())

				return
			end

			if string.lower(arguments[1]) == "medical" then
				Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name() .. " has rolled a Medical d20, they rolled " .. roll .. " out of " .. number .. "! Adding " .. math.Round(atbm) .. " from their attribute roll, the total is " .. roll + math.Round(atbm))
				Clockwork.chatBox:AddInRadius(player, "roll", "has rolled a Medical d20, they rolled " .. roll .. " out of " .. number .. " Adding " .. math.Round(atbm) .. " from their attribute roll, the total is " .. roll + math.Round(atbm) .. "!", player:GetPos(), Clockwork.config:Get("talk_radius"):Get())

				return
			end

			if string.lower(arguments[1]) == "endurance" then
				Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name() .. " has rolled an Endurance d20, they rolled " .. roll .. " out of " .. number .. "! Adding " .. math.Round(atbe) .. " from their attribute roll, the total is " .. roll + math.Round(atbe))
				Clockwork.chatBox:AddInRadius(player, "roll", "has rolled an Endurance d20, they rolled " .. roll .. " out of " .. number .. " Adding " .. math.Round(atbe) .. " from their attribute roll, the total is " .. roll + math.Round(atbe) .. "!", player:GetPos(), Clockwork.config:Get("talk_radius"):Get())

				return
			end

			if string.lower(arguments[1]) == "strength" then
				Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name() .. " has rolled an Strength d20, they rolled " .. roll .. " out of " .. number .. "! Adding " .. math.Round(atbs) .. " from their attribute roll, the total is " .. roll + math.Round(atbs))
				Clockwork.chatBox:AddInRadius(player, "roll", "has rolled an Strength d20, they rolled " .. roll .. " out of " .. number .. " Adding " .. math.Round(atbs) .. " from their attribute roll, the total is " .. roll + math.Round(atbs) .. "!", player:GetPos(), Clockwork.config:Get("talk_radius"):Get())

				return
			end

			if string.lower(arguments[1]) == "dexterity" then
				Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name() .. " has rolled a Dexterity d20, they rolled " .. roll .. " out of " .. number .. "! Adding " .. math.Round(atbd) .. " from their attribute roll, the total is " .. roll + math.Round(atbd))
				Clockwork.chatBox:AddInRadius(player, "roll", "has rolled a Dexterity d20, they rolled " .. roll .. " out of " .. number .. " Adding " .. math.Round(atbd) .. " from their attribute roll, the total is " .. roll + math.Round(atbd) .. "!", player:GetPos(), Clockwork.config:Get("talk_radius"):Get())

				return
			end

			if string.lower(arguments[1]) == "agility" then
				Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name() .. " has rolled an Agility d20, they rolled " .. roll .. " out of " .. number .. "! Adding " .. math.Round(atbg) .. " from their attribute roll, the total is " .. roll + math.Round(atbg))
				Clockwork.chatBox:AddInRadius(player, "roll", "has rolled an Agility d20, they rolled " .. roll .. " out of " .. number .. " Adding " .. math.Round(atbg) .. " from their attribute roll, the total is " .. roll + math.Round(atbg) .. "!", player:GetPos(), Clockwork.config:Get("talk_radius"):Get())

				return
			end

			if arguments[1] ~= "acrobatics" or arguments[1] ~= "medical" or arguments[1] ~= "endurance" or arguments[1] ~= "strength" or arguments[1] ~= "dexterity" or arguments[1] ~= "agility" then
				player:Notify(arguments[1] .. " is not a valid attribute!")
				player:Notify("The following attributes are valid: Acrobatics, Medical, Endurance, Strength, Dexterity, Agility.")

				return
			end
		end

		if not arguments[1] then
			Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name() .. " has rolled a generic d20, they rolled " .. roll .. " out of " .. number .. "!")
			Clockwork.chatBox:AddInRadius(player, "roll", "has rolled a generic d20, they rolled " .. roll .. " out of " .. number .. ".", player:GetPos(), Clockwork.config:Get("talk_radius"):Get())
		end
	end

	COMMAND:Register()
end