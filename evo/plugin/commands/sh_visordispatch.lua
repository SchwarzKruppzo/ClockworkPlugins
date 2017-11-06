--[[ 
		Created by Polis, July 2014.
		Do not re-distribute as your own.
]]

local COMMAND = Clockwork.command:New("VisorDispatch");
COMMAND.tip = "Talk as Dispatch through the combine visor.";
COMMAND.text = "<string Text>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER);
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		if (Schema:IsPlayerCombineRank( player, {"SCN", "SeC", "CmD", "DvL"} ) or player:GetFaction() == FACTION_OTA or player:GetFaction() == FACTION_ADMIN or player:GetFaction() == FACTION_MPF) then
			local text = table.concat(arguments, " ");
			
			if (text == "") then
				Clockwork.player:Notify(player, "You did not specify enough text!");
				
				return;
			end;
			
			Schema:AddCombineDisplayLine( "!DISPATCH: "..text, Color(255, 150, 0, 255) );
			BroadcastLua("LocalPlayer():ConCommand('virgil1')")
		else
			Clockwork.player:Notify(player, "You cannot do this right now!");
		end;
	else
		Clockwork.player:Notify(player, "You are not the combine!");
	end;
end;



COMMAND:Register();