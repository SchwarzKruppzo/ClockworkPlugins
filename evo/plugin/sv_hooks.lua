--[[ 
		Created by Polis, July 2014.
		Do not re-distribute as your own.
]]

/*----------------------\
| Edited by Viomi       |
| viomi@openmailbox.org | // Removed all the god damn semi-colons
\----------------------*/

local PLUGIN = PLUGIN

	function Schema:PlayerPlayDeathSound(player, gender)
		if (self:PlayerIsCombine(player)) then
			local sound = ""
			if player:GetFaction() == FACTION_MPF then
				sound = "npc/metropolice/die"..math.random(1, 4)..".wav"
			else
				sound = "npc/combine_soldier/die"..math.random(1, 3)..".wav"
			end
			
			for k, v in ipairs( _player.GetAll() ) do
				if (v:HasInitialized()) then
					if (self:PlayerIsCombine(v)) then
						v:EmitSound(sound)
					end
				end
			end
			
			return sound
		end
	end

	function Schema:PlayerPlayPainSound(player, gender, damageInfo, hitGroup)
		if (self:PlayerIsCombine(player)) then
			if player:GetFaction() == FACTION_MPF then
				return "npc/metropolice/pain"..math.random(1, 4)..".wav"
			else
				return "npc/combine_soldier/pain"..math.random(1, 3)..".wav"
			end
		end
	end


function PLUGIN:PlayerStartTypingDisplay(player, code)
	if (Schema:PlayerIsCombine(player) and !player:IsNoClipping()) then
		if (code == "n" or code == "y" or code == "w" or code == "r") then
			if (!player.typingBeep) then
				player.typingBeep = true
				
				player:EmitSound("ambient/levels/prison/radio_random"..math.random(10, 15)..".wav")
			end
		end
	end
end


function PLUGIN:PlayerFinishTypingDisplay(player, textTyped)
	if (Schema:PlayerIsCombine(player) and textTyped) then
		if (player.typingBeep) then
			player:EmitSound("ambient/levels/prison/radio_random"..math.random(1, 9)..".wav")
		end
	end
	
	player.typingBeep = nil
end
