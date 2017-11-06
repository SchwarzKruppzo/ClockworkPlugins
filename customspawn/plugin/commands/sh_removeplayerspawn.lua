local Clockwork = Clockwork;
 
local COMMAND = Clockwork.command:New("PlyRemoveSpawn");
COMMAND.tip = "Remove a player's Spawnpoint";
COMMAND.text = "<string Name>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;
COMMAND.access = "o"
 
-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	if target then	
        target:SetCharacterData("CustomSpawnPoint", nil);
		if target != player then
			Clockwork.player:Notify(player, "You have removed "..target:Name().."'s custom spawnpoint, He/She will now default to the Default spawn.");
		else
			Clockwork.player:Notify(player, "You've removed your custom Spawnpoint, you'll now default to the Default spawn.");
		end;
	else
		Clockwork.player:Notify(player, target:Name().." is not a Valid Player!");
	end;
end;
 
COMMAND:Register();