--[[
	© 2017 TeslaCloud Studios.
	Feel free to use, edit or share the plugin, but
	do not re-distribute without the permission of it's author.
--]]

local COMMAND = Clockwork.command:New("NameSay");
COMMAND.tip = "Says your Name informally.";
COMMAND.flags = CMD_DEFAULT;

-- Called when the command has been run.
function COMMAND:OnRun(player)
	local name = player:Name();
    local radius = Clockwork.config:Get("talk_radius"):Get();
    
	if (!Schema:PlayerIsCombine(player)) then
	    Clockwork.chatBox:AddInTargetRadius(player, "ic", "My name is "..name..".", player:GetPos(), radius);
    else
	    Clockwork.chatBox:AddInTargetRadius(player, "ic", "I am unit "..name..".", player:GetPos(), radius);
	end;
	
	for k, v in pairs(_player.GetAll()) do
	    if(v:GetPos():Distance(player:GetPos()) <= radius 
		and Clockwork.config:Get("apply_recognise_enable"):Get() 
		and IsValid(v) and v:HasInitialized()) then
			Clockwork.player:SetRecognises(v, player, RECOGNISE_TOTAL);
		end;
	end;
end;

COMMAND:Register();