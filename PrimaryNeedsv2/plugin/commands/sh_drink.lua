local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("Drink");
COMMAND.tip = "Take a drink from a water source (You need to be standing in the water).";
COMMAND.text = "<none>";
COMMAND.flags = CMD_DEFAULT;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (player:WaterLevel() >= 1) then
		player:SetCharacterData( "thirst", math.Clamp(player:GetCharacterData("thirst") - 25, 0, 100) )
		player:EmitSound("npc/barnacle/barnacle_gulp1.wav");
	else
		Clockwork.player:Notify(player, "You aren't in water!");
	end;
end;

COMMAND:Register();