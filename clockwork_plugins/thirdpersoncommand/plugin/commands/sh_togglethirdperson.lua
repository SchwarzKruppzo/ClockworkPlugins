local COMMAND = Clockwork.command:New("ToggleThirdPerson");

COMMAND.tip = "Toggles third person.";
COMMAND.text = "";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if player:GetNWBool("thirdperson") then
		cwThirdPerson:Disable(player);
	else
		cwThirdPerson:Enable(player);
	end;
end;

COMMAND:Register();