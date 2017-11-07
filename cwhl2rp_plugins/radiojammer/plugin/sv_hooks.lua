local PLUGIN = PLUGIN

-- We don't want the jammer to keep going when people get off their characters.
function PLUGIN:PlayerCharacterUnloaded(player)
	if player:HasItemByID("radio_jammer") then
		local Jammer = player:FindItemByID("radio_jammer")
		if Jammer:GetData("active") then
			for k,v in pairs(_player.GetAll()) do
				-- This is ok to do because the means of getting the players that should have their radio jammed is called every tick.
				v:SetSharedVar("affectedbyjam", false)
			end
			Jammer:SetData("useText", "Turn on")
			Jammer:SetData("active", false)
		end
	end
end

-- Ditto here with when they get on.
function PLUGIN:PlayerCharacterLoaded(player)
	if player:HasItemByID("radio_jammer") then
		local Jammer = player:FindItemByID("radio_jammer")
		if Jammer:GetData("active") then
			for k,v in pairs(_player.GetAll()) do
				v:SetSharedVar("affectedbyjam", false)
			end
			Jammer:SetData("useText", "Turn on")
			Jammer:SetData("active", false)
		end
	end
end

function PLUGIN:ChatBoxAdjustInfo(info)
	if info.class == "radio" or info.class == "request" then
		local speaker = info.speaker

		-- If someone just received a message from a person affected by the jammer, we should garble the message completely and not display the speaker's name.
		if speaker:GetSharedVar("affectedbyjam") then
			local garbletext = ""
			local text = info.text

			-- Replace all characters in the message with random characters.
			info.text:gsub(".", function(char)
				local randchar = string.char(math.random(33,126))
				char = randchar

				garbletext = garbletext..char
			end)

			-- We don't want the first character to be ?, that'll cause the message to say "Somebody radios in", so we'll just replace it with some other character that can occur before "?".
			if string.sub(garbletext, 1, 1) ~= "?" then
				garbletext:gsub("?", string.char(33,62))
			end
			-- Set the text to our garbled string.
			info.text = garbletext
		end
	end
end


function PLUGIN:PlayerTick(player)
	if player:HasInitialized() and player:HasItemByID("radio_jammer") then
		local Jammer = player:FindItemByID("radio_jammer")
		if Jammer:GetData("active") then
			-- Grab all the players and check if they're within the effective range of the jammer, if they are, have them be affected by the jammer.
			for k,v in pairs(_player.GetAll()) do
				if v:GetPos():Distance(player:GetPos()) <= Clockwork.config:Get("jammer_range"):Get() then
					v:SetSharedVar("affectedbyjam", true)
				else
					-- Fix for unexplainable bug.
					if v:HasItemByID("radio_jammer") then
						if v:FindItemByID("radio_jammer"):GetData("active") then
							v:SetSharedVar("affectedbyjam", true)
						end
					else
						v:SetSharedVar("affectedbyjam", false)
					end
				end
			end

			-- Make our jammer emit an electric spark sound each third second.
			if (!NextSFX) then
				NextSFX = CurTime() + 3
			end

			if CurTime() >= NextSFX then
				NextSFX = nil
				player:EmitSound("ambient/energy/spark"..math.random(1,6)..".wav", 50)
			end
		end
	end
end