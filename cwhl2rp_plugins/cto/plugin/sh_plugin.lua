PLUGIN:SetGlobalAlias("cwCTO");

cwCTO.sociostatusColors = {
	GREEN = Color(0, 255, 0),
	BLUE = Color(0, 128, 255),
	YELLOW = Color(255, 255, 0),
	RED = Color(255, 0, 0),
	BLACK = Color(128, 128, 128)
};

-- Biosignal change enums, used for player/admin command language variations.
cwCTO.ERROR_NONE = 0;
cwCTO.ERROR_NOT_COMBINE = 1;
cwCTO.ERROR_ALREADY_ENABLED = 2;
cwCTO.ERROR_ALREADY_DISABLED = 3;

-- Movement violation enums, used when networking cameras.
cwCTO.VIOLATION_RUNNING = 0;
cwCTO.VIOLATION_JOGGING = 1;
cwCTO.VIOLATION_JUMPING = 2;
cwCTO.VIOLATION_CROUCHING = 3;
cwCTO.VIOLATION_FALLEN_OVER = 4;

-- Camera controlling enums.
cwCTO.CAMERA_VIEW = 0;
cwCTO.CAMERA_DISABLE = 1;
cwCTO.CAMERA_ENABLE = 2;

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");

-- Called when the Clockwork shared variables are added.
--[[function cwCTO:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:Bool("IsBiosignalGone");
end;]]

Clockwork.player:AddCharacterData("IsBiosignalGone", NWTYPE_BOOL, false);
Clockwork.player:AddCharacterData("IsCIDTagGone", NWTYPE_BOOL, false);

Clockwork.player:AddCharacterData("citizenid", NWTYPE_STRING); -- network CIDs

if (SERVER) then
	Clockwork.config:Add("cto_biosignal_unobstruct", true, true);
	Clockwork.config:Add("cto_biosignal_distance", 0, true);

	Clockwork.config:Add("cto_expire_biosignals", 120, true);
	Clockwork.config:Add("cto_expire_requests", 60, true);

	Clockwork.config:Add("cto_use_tag_system", true, true);
	Clockwork.config:Add("cto_citizen_distance", 2048, true);
else
	Clockwork.config:AddToSystem("Biosignals Unobstructed", "cto_biosignal_unobstruct", "Whether or not biosignals/cameras should be visible through walls. Requests, losses, violations, etc are exempt.", true);
	Clockwork.config:AddToSystem("Biosignal Maximum Distance", "cto_biosignal_distance", "The maximum distance to see biosignals/cameras. Requests, losses, violations, etc are exempt. Set to 0 for infinite.", 0, 20000);

	Clockwork.config:AddToSystem("Biosignal Expiry Time", "cto_expire_biosignals", "Time in seconds until a lost biosignal disappears.", 10, 3600);
	Clockwork.config:AddToSystem("Request Expiry Time", "cto_expire_requests", "Time in seconds until a request disappears.", 10, 3600);

	Clockwork.config:AddToSystem("Use CID Tag System", "cto_use_tag_system", "Whether or not to use the CID tag visor system.", true);
	Clockwork.config:AddToSystem("Citizen Data Maximum Distance", "cto_citizen_distance", "The maximum distance to see movement violations and CID tags.", 64, 65536);
end;

function cwCTO:isCameraEnabled(camera)
	return (camera:GetSequenceName(camera:GetSequence()) == "idlealert");
end;
