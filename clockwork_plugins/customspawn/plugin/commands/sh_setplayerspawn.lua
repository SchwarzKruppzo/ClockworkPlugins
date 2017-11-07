local Clockwork = Clockwork;
 
local COMMAND = Clockwork.command:New("PlySetSpawn");
COMMAND.tip = "Set a player's spawn point";
COMMAND.text = "<string Name>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;
COMMAND.access = "o"
 
-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local position = player:GetEyeTrace().HitPos
	local posTable = {
			x = position.x,
			y = position.y,
			z = position.z
	};
	if target then        
		target:SetCharacterData("CustomSpawnPoint", posTable);
		if target != player then
			Clockwork.player:Notify(player, "You have set "..target:Name().."'s spawnpoint to a custom Location.");
		else
			Clockwork.player:Notify(player, "You've set your own spawnpoint to a Custom Location.");
		end;
	else
		Clockwork.player:Notify(player, target:Name().." is not a Valid Player!");
	end;
end;
 
COMMAND:Register();