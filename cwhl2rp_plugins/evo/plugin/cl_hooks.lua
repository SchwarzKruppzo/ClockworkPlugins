/*----------------------\
| Created by Viomi      |
| viomi@openmailbox.org |
\----------------------*/

-- Called each tick.
function Schema:Tick()
	if (IsValid(Clockwork.Client)) then
		if (self:PlayerIsCombine(Clockwork.Client)) then
			local curTime = CurTime()
			local health = Clockwork.Client:Health()
			local armor = Clockwork.Client:Armor()

			if (!self.nextHealthWarning or curTime >= self.nextHealthWarning) then
				if (self.lastHealth) then
					if (health < self.lastHealth) then
						if (health == 0) then
							self:AddCombineDisplayLine( "ERROR! Shutting down...", Color(255, 0, 0, 255) )
						else
							self:AddCombineDisplayLine( "WARNING! Physical bodily trauma detected...", Color(255, 0, 0, 255) )
						end
						
						self.nextHealthWarning = curTime + 15
					elseif (health > self.lastHealth) then
						if (health == 100) then
							self:AddCombineDisplayLine( "Physical body systems restored...", Color(0, 255, 0, 255) )
						else
							self:AddCombineDisplayLine( "Physical body systems regenerating...", Color(0, 0, 255, 255) )
						end
						
						self.nextHealthWarning = curTime + 15
					end
				end
				
				if (self.lastArmor) then
					if (armor < self.lastArmor) then
						if (armor == 0) then
							self:AddCombineDisplayLine( "WARNING! External protection exhausted...", Color(255, 0, 0, 255) )
						else
							self:AddCombineDisplayLine( "WARNING! External protection damaged...", Color(255, 0, 0, 255) )
						end
						
						self.nextHealthWarning = curTime + 15
					elseif (armor > self.lastArmor) then
						if (armor == 100) then
							self:AddCombineDisplayLine( "External protection systems restored...", Color(0, 255, 0, 255) )
						else
							self:AddCombineDisplayLine( "External protection systems regenerating...", Color(0, 0, 255, 255) )
						end
						
						self.nextHealthWarning = curTime + 15
					end
				end
			end
			
			if (!self.nextRandomLine or curTime >= self.nextRandomLine) then
				local text = self.randomDisplayLines[ math.random(1, #self.randomDisplayLines) ]
				
				if (text and self.lastRandomDisplayLine != text) then
					self:AddCombineDisplayLine(text)
					
					self.lastRandomDisplayLine = text
				end
				
				self.nextRandomLine = curTime + 3
			end
			
			self.lastHealth = health
			self.lastArmor = armor
		end
	end
end