local COMMAND = Clockwork.command:New("Scream");
COMMAND.tip = "Makes you scream.";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_DEATHCODE, CMD_FALLENOVER);
 
-- Called when the command has been run.
function COMMAND:OnRun(player)
        if (string.find(player:GetModel(), "stalker")) then
                player:EmitSound("npc/stalker/go_alert2a.wav");
        else
                Clockwork.player:Notify("You're not an Stalker!")
        end;
end;
 
 
COMMAND:Register();