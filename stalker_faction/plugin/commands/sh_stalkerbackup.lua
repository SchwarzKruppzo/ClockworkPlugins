local COMMAND = Clockwork.command:New("StalkerBackup");
COMMAND.tip = "Request a Backup to all Combines and Civil Protection units.";
COMMAND.text = "<string Details>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER);
COMMAND.args = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		if (player:GetFaction() == FACTION_STALKER) then
			local text = table.concat(arguments, " ");

			if (text == "") then
				local text = "N/A";
				
				return;
			end;
			
			Schema:AddCombineDisplayLine( "Citadel Worker:"..player:Name().." is requesting a backup. DETAILS: "..text..".", Color(250, 118, 17, 255) );
			player:EmitSound("npc/overwatch/radiovoice/controlsection.wav");
		    BroadcastLua("LocalPlayer():ConCommand('backup')")
	else
		Clockwork.player:Notify(player, "You are not a Stalker!");
	end;
end;
end;

COMMAND:Register();