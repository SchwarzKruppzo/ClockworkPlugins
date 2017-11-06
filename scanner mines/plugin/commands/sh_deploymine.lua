local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("MineDeploy");
COMMAND.tip = "Deploy an equipped mine.";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema.scanners[player]) then
		local scanner = Schema.scanners[player][1];
		
		if (IsValid(scanner)) then
			if Schema:IsPlayerCombineRank(player, "SYNTH") then
				if player.mineReady == true then
					scanner:Input("DeployMine");
						
					Clockwork.player:Notify(player, "You have deployed a mine!");
					
					player.mineReady = false;
				else
					Clockwork.player:Notify(player, "You already have a mine readied!");
				end;
			end;
		end;
	else
		Clockwork.player:Notify(player, "You are not a scanner!");
	end;
end;

COMMAND:Register();