--[[
	© 2017 Piluzeu Studios.
	Feel free to use, edit or share the plugin, but
	do not re-distribute without the permission of it's author.
--]]

local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("Froll");
COMMAND.tip = "Force your roll number.";
COMMAND.text = "[number]";
COMMAND.access = "5";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local number = math.Clamp(math.floor(tonumber(arguments[1]) or 100), 0, 1000000000);
	local roll = math.random(0, number)
		
	Clockwork.chatBox:AddInRadius(player, "roll", "has rolled "..arguments[1].." out of 100.",
		player:GetPos(), Clockwork.config:Get("talk_radius"):Get());
	Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().." has rolled "..arguments[1].." out of 100!");
end;

COMMAND:Register();