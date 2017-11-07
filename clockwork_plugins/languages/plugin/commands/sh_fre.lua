--[[
	Made by Cinder.  March 2016.
	Do not re-distribute as your own or modify without the permission of the creator.
]]

local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("Fre");
COMMAND.tip = "Speak in French.";
COMMAND.text = "<string speech>";
COMMAND.flags = bit.bor(CMD_DEFAULT);
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Clockwork.player:HasFlags(player, "F")) then
		local speech = arguments[1]

		for k,v in pairs(_player.GetAll()) do
			local distance = v:GetPos():Distance(player:GetPos());
			if (math.floor(distance) <= Clockwork.config:Get("talk_radius"):Get()) then
				if (Clockwork.player:HasFlags(v, "F")) then			
				Clockwork.chatBox:SendColored(v, Color(102, 205, 170, 255), "[French] "..player:Name()..": "..speech)
			else
				Clockwork.chatBox:SendColored(v, Color(102, 205, 170, 255), player:Name().." speaks in a language you cannot understand.")
				end;
			end;
		end;
	else
		Clockwork.player:Notify(player, "You do not speak French!")
	end;
end;

COMMAND:Register();