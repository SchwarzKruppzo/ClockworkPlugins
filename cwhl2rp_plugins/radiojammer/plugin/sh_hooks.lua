local PLUGIN = PLUGIN

function PLUGIN:ClockworkAddSharedVars(globalVars, playerVars)
	-- It's far easier to check if a player is affected by the jammer rather than marking items or stationary radios as affected.
	playerVars:Bool("affectedbyjam", false)
end