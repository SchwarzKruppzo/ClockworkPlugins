--[[
	� 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local COMMAND = Clockwork.command:New("HEVendorAdd");
COMMAND.tip = "Add a health charger at your target position.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	local entity = scripted_ents.Get("cw_hevendor"):SpawnFunction(player, trace)
	
	
	if ( IsValid(entity) ) then
		
		Clockwork.player:Notify(player, "You have added a health charger.");
	end;
end;

COMMAND:Register();