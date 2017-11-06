local PLUGIN = PLUGIN

function PLUGIN:PrePACEditorOpen(player)
	if !Clockwork.player:HasFlags(player, "W") then
		return false
	end
end