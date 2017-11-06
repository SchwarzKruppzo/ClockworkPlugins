local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("MineEquip");
COMMAND.tip = "Equip a mine so you can deploy it.";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema.scanners[player]) then
		local scanner = Schema.scanners[player][1];
		local curTime = CurTime();
		if (IsValid(scanner)) then
			if Schema:IsPlayerCombineRank(player, "SYNTH") then
				if !player.nextMine or player.nextMine <= curTime then
					if player.mineReady != true then
						scanner:Input("EquipMine");
							
						Clockwork.player:Notify(player, "You have readied a mine!");
						
						player.mineReady = true;
						player.nextMine = curTime + 15;
					else
						Clockwork.player:Notify(player, "You already have a mine readied!");
					end;
				end;
			end;
		end;
	else
		Clockwork.player:Notify(player, "You are not a scanner!");
	end;
end;

COMMAND:Register();