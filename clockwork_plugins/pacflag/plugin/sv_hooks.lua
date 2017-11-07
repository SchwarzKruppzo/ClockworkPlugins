local PLUGIN = PLUGIN

function PLUGIN:PrePACConfigApply(player)
	if !Clockwork.player:HasFlags(player, "W") then
		return false
	end
end