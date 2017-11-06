local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("PlyBlacklist");
COMMAND.tip = "Blacklist a player from a faction.";
COMMAND.text = "<string Name> <string Faction>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 2;
function COMMAND:OnRun(player, arguments)
  local target = Clockwork.player:FindByID(arguments[1]);
  local faction = Clockwork.faction:FindByID(arguments[2]);
  local character = target:GetCharacter();
  local characterFaction = Clockwork.faction:FindByID(character.faction);


  PLUGIN:Blacklist(arguments[1], faction, function(steamName)
    if(IsValid(player)) then
    if(steamName) then
      Clockwork.player:NotifyAll(player:Name() .. " has blacklisted " ..
      steamName .. " from the " .. faction.name .. " faction.");
    end;
  end;
end);

if(IsValid(target) and target:GetCharacter()) then
  if(faction == characterFaction) then
    Clockwork.player:SetBanned(target, true);
    target:KillSilent();
    end;
  end;
end;
COMMAND:Register();
