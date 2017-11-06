--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("Calladmin");
COMMAND.tip = "Send a message to all online staff members.";
COMMAND.text = "<string Msg>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local listeners = {};
	
	for k, v in pairs(_player.GetAll()) do
		if (v:IsUserGroup("operator") or v:IsAdmin()
		or v:IsSuperAdmin()) then
			listeners[#listeners + 1] = v;
		end;
	end;
	
	Clockwork.chatBox:SendColored(listeners, Color(255, 71, 133), "(HELP) ".. player:Name(), ": ", Color(255, 255, 255), table.concat(arguments, " "))
end;

COMMAND:Register();