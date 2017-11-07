/*--------------------------------------------------------------------------\
| THIS ENTIRE PLUGIN IS CREATED BY VIOMI                                    |
| PLEASE DO NOT COPY OR SELL ANY CODE IN HERE WITHOUT PERMISSION FROM VIOMI |
| Contact: viomi@openmailbox.org                                            |
\--------------------------------------------------------------------------*/

PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("MyData");
COMMAND.tip = "View data about yourself, if you're an admin.";
COMMAND.text = "<none>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player)
	if (player:IsSuperAdmin() or player:IsAdmin()) then
		Clockwork.datastream:Start( player, "EditData", { player, player:GetCharacterData("combinedata") } );
		player.editDataAuthorised = player;
	else
		Clockwork.player:Notify(player, "You are not an Admin.");
	end;
end;

COMMAND:Register();