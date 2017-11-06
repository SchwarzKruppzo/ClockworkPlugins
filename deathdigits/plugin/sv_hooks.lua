local PLUGIN = PLUGIN

function PLUGIN:Initialize()
	function Schema:PlayerDeath(player, inflictor, attacker, damageInfo)
		if (self:PlayerIsCombine(player)) then
			local location = self:PlayerGetLocation(player)
			local Digits = string.match(player:Name(), "%d%d%d%d?%d?")
			
			self:AddCombineDisplayLine("Downloading lost biosignal...", Color(255, 255, 255, 255), nil, player)
			self:AddCombineDisplayLine("WARNING! Biosignal lost for protection team unit "..Digits.." at "..location.."...", Color(255, 0, 0, 255), nil, player)
			
			if (self.scanners[player]) then
				if (IsValid( self.scanners[player][1] )) then
					if (damageInfo != true) then
						self.scanners[player][1]:TakeDamage(self.scanners[player][1]:Health() + 100)
					end
				end
			end
			
			for k, v in ipairs( _player.GetAll() ) do
				if (self:PlayerIsCombine(v)) then
					v:EmitSound("npc/metropolice/vo/on"..math.random(1,2)..".wav")
					v:EmitSound("npc/overwatch/radiovoice/lostbiosignalforunit.wav")

					timer.Simple(2.3, function()
						for i = 1,#Digits do
							timer.Simple((i - 1) / 2, function()
								local DigitToString = {
									[1] = "one",
									[2] = "two",
									[3] = "three",
									[4] = "four",
									[5] = "five",
									[6] = "six",
									[7] = "seven",
									[8] = "eight",
									[9] = "nine",
									[0] = "zero"
								}

								local Digit = tonumber(string.sub(Digits, i, i))
		
								v:EmitSound("npc/overwatch/radiovoice/"..DigitToString[Digit]..".wav")
		
								if i == #Digits then
									timer.Simple(0.5, function()
										local postDigitMessages = {
											"npc/overwatch/radiovoice/remainingunitscontain.wav",
											"npc/overwatch/radiovoice/reinforcementteamscode3.wav",
											"npc/overwatch/radiovoice/allteamsrespondcode3.wav",
											"npc/overwatch/radiovoice/investigateandreport.wav"
										}
										local postDigitSound = postDigitMessages[math.random(1,#postDigitMessages)]
										v:EmitSound(postDigitSound)
										timer.Simple(SoundDuration(postDigitSound)+0.1, function()
											v:EmitSound("npc/metropolice/vo/off"..math.random(1,4)..".wav")
										end)
									end)
								end
							end)
						end
					end)
				end
			end
		end
	end
end