local COMMAND = Clockwork.command:New("Forums");
COMMAND.tip = "View our forums!";	
COMMAND.flags = CMD_DEFAULT;

-- Thanks to NightAngel for showing me this function instead of me making my own!
function COMMAND:OnRun(player)
     player:SendLua([[gui.OpenURL("Forums name!")]])
	 Clockwork.player:Notify(player, "Bringing you to our website now!")
end;

COMMAND:Register();
