local PLUGIN = PLUGIN

function PLUGIN:Initialize()
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
end