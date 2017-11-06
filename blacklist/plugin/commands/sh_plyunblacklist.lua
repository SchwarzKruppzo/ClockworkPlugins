local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("PlyUnBlacklist");
COMMAND.tip = "Un-blacklists a player from a faction.";
COMMAND.text = "<string Name> <string Faction>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 2;
function COMMAND:OnRun(player, arguments)
  local faction = Clockwork.faction:FindByID(arguments[2]);
  local target = Clockwork.player:FindByID(arguments[1]);
  local identifier = string.upper(arguments[1]);

  PLUGIN:UnBlacklist(identifier, faction);
  Clockwork.player:NotifyAll(player:Name() .. " has unblacklisted " .. target:SteamName() ..
  " from the " .. faction.name .. " faction.");
end;
COMMAND:Register();
