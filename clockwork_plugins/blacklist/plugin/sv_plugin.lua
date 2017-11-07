local PLUGIN = PLUGIN;

PLUGIN.blacklists = Clockwork.kernel:NewLibrary("Blacklists");
PLUGIN.blacklists.stored = PLUGIN.blacklists.stored or {};

Clockwork.config:Add("mysql_blacklist_table", "blacklists", nil, nil, true, true, true);

function PLUGIN:PlayerCharacterCreated(player, character)
  if(PLUGIN.blacklists.stored[player:SteamID()]) then
    local blacklists = PLUGIN.blacklists.stored[player:SteamID()].blackTable;
    for k, v in pairs(blacklists) do
      if(character.faction == v) then
        character.data["CharBanned"] = true;
      end;
    end;
  end;
end;

function PLUGIN:PlayerCharacterLoaded(player)
  if(PLUGIN.blacklists.stored[player:SteamID()]) then
    local blacklists = PLUGIN.blacklists.stored[player:SteamID()].blackTable;
    for k, v in pairs(blacklists) do
      if(player:GetCharacter().faction == v) then
        player:GetCharacter().data["CharBanned"] = true;
        player:KillSilent();
        Clockwork.player:Notify(player, "You cannot load a character under a blacklisted faction!");
      end;
    end;
  end;
end;
-- Called when a player attempts to use a character.
function PLUGIN:PlayerCanUseCharacter(player, character)
  if(PLUGIN.blacklists.stored[player:SteamID()]) then
    local identifier = player:SteamID();
    local blacklists = PLUGIN.blacklists.stored[identifier].blackTable;
    local faction = Clockwork.faction:FindByID(character.faction);

    for k, v in pairs(blacklists) do
      if(faction.name == v) then
        character.data["CharBanned"] = true;
        return "You are blacklisted from this faction!";
      end;
    end;
  end;
end;

local function BLACKLIST_CALLBACK(result)
  if (Clockwork.database:IsResult(result)) then
    for k, v in pairs(result)do
      PLUGIN.blacklists.stored[v._Identifier] = {
        blackTable = Clockwork.kernel:Deserialize(v._Blacklists);
        steamName = v._SteamName
      };
    end;
  end;
end;

local function RETRIEVE_TABLES()
  local blacklistTable = Clockwork.config:Get("mysql_blacklist_table"):Get();
  local schemaFolder = Clockwork.kernel:GetSchemaFolder();
  local queryObj = Clockwork.database:Select(blacklistTable);
  queryObj:AddWhere("_Schema = ?", schemaFolder);
  queryObj:SetCallback(BLACKLIST_CALLBACK);
  queryObj:Pull();
end;

function PLUGIN:PlayerInitialSpawn(player)
  if(IsValid(player)) then
    RETRIEVE_TABLES();
  end;
end;



-- A function to blacklist a player from a faction.
function PLUGIN:Blacklist(identifier, faction, Callback, bSaveless)
  local steamName = nil;
  local playerGet = Clockwork.player:FindByID(identifier);
  local blacklistTable = Clockwork.config:Get("mysql_blacklist_table"):Get();
  local schemaFolder = Clockwork.kernel:GetSchemaFolder();
  local blackTable = {};
  local isListed = false;


  if (identifier) then
    identifier = string.upper(identifier);
  end;

  for k, v in pairs(player.GetAll()) do
    local playerIP = v:IPAddress();
    local playerSteam = v:SteamID();

    if (playerSteam == identifier or playerIP == identifier or playerGet == v) then

      if (playerIP == identifier) then
        identifier = playerIP;
      else
        identifier = playerSteam;
      end;

      steamName = v:SteamName();
    end;
  end;


  if(PLUGIN.blacklists.stored[identifier] == nil or PLUGIN.blacklists.stored[identifier].blackTable == {}) then
    isListed = false;
  else
    isListed = true;
  end;


  if(PLUGIN.blacklists.stored[identifier] == nil or PLUGIN.blacklists.stored[identifier] == {}) then
    local blackTable = {};
    PLUGIN.blacklists.stored[identifier] = {
      steamName = steamName,
      blackTable = blackTable
    };
    blackTable[#blackTable + 1] = faction.name;
    PLUGIN.blacklists.stored[identifier].blackTable = blackTable;
  end;


  if(PLUGIN.blacklists.stored[identifier]) then
    if(!table.HasValue(PLUGIN.blacklists.stored[identifier].blackTable, faction.name)) then
      table.insert(PLUGIN.blacklists.stored[identifier].blackTable, faction.name);
    end;
  end;

  if(Clockwork.player:IsWhitelisted(playerGet, faction)) then
    Clockwork.player:SetWhitelisted(playerGet, faction.name, false);
    Clockwork.player:SaveCharacter(playerGet);
  end;

  local serialTable = Clockwork.kernel:Serialize(PLUGIN.blacklists.stored[identifier].blackTable);


  if (!bSaveless) then
    if(isListed) then
      print("updated");
      local queryObj = Clockwork.database:Update(blacklistTable);
      queryObj:AddWhere("_Schema = ?", schemaFolder);
      queryObj:AddWhere("_Identifier = ?", identifier);
      queryObj:SetValue("_Blacklists", serialTable)
      queryObj:Push();
    else
      print("table set");
      local queryObj = Clockwork.database:Insert(blacklistTable);
      queryObj:SetValue("_Identifier", identifier);
      queryObj:SetValue("_SteamName", PLUGIN.blacklists.stored[identifier].steamName);
      queryObj:SetValue("_Blacklists", serialTable);
      queryObj:SetValue("_Schema", schemaFolder);
      queryObj:Push();
    end;


    if (Callback) then
      Callback(steamName);
    end;
    isListed = false;
    return;
  end;


  local playersTable = Clockwork.config:Get("mysql_players_table"):Get();

  if (string.find(identifier, "STEAM_(%d+):(%d+):(%d+)")) then
    local queryObj = Clockwork.database:Select(playersTable);
    queryObj:AddWhere("_SteamID = ?", identifier);
    queryObj:SetCallback(function(result)
      local steamName = identifier;

      if (Clockwork.database:IsResult(result)) then
        steamName = result[1]._SteamName;
      end;

      PLUGIN.blacklists.stored[identifier] = {
        steamName = steamName,

      };

      if (Callback) then
        Callback(steamName);
      end;
    end);
    queryObj:Pull();
    RETRIEVE_TABLES();
    isListed = false;
    return;
  end;
end;


-- A function to remove a a player from a blacklist.
function PLUGIN:UnBlacklist(identifier, faction, bSaveless)
  local blacklistTable = Clockwork.config:Get("mysql_blacklist_table"):Get();
  local schemaFolder = Clockwork.kernel:GetSchemaFolder();
  local playerGet = Clockwork.player:FindByID(identifier);

  if (identifier) then
    identifier = string.upper(identifier);
  end;

  for k, v in pairs(_player.GetAll()) do
    local playerIP = v:IPAddress();
    local playerSteam = v:SteamID();

    if (playerSteam == identifier or playerIP == identifier or playerGet == v) then

      if (playerIP == identifier) then
        identifier = playerIP;
      else
        identifier = playerSteam;
      end;

      steamName = v:SteamName();
    end;
  end;

  if (PLUGIN.blacklists.stored[identifier]) then
    table.RemoveByValue(PLUGIN.blacklists.stored[identifier].blackTable, faction.name);
    if(table.Count(PLUGIN.blacklists.stored[identifier].blackTable) == 0) then

      PLUGIN.blacklists.stored[identifier] = nil;
      local queryObj = Clockwork.database:Delete(blacklistTable);
      queryObj:AddWhere("_Schema = ?", schemaFolder);
      queryObj:AddWhere("_Identifier = ?", identifier);
      queryObj:Push();

      if(IsValid(playerGet)) then
        for k, v in pairs(playerGet:GetCharacters()) do
          if(v.faction == faction.name) then
            v.data["CharBanned"] = false;
          end;
        end;
      end;
    else
    if(IsValid(playerGet)) then
      for k, v in pairs(playerGet:GetCharacters()) do
        if(v.faction == faction.name) then
          v.data["CharBanned"] = false;
        end;
      end;
    end;

    local serializedTable = Clockwork.kernel:Serialize(PLUGIN.blacklists.stored[identifier].blackTable)
    if (!bSaveless) then
      local queryObj = Clockwork.database:Update(blacklistTable);
      queryObj:AddWhere("_Schema = ?", schemaFolder);
      queryObj:AddWhere("_Identifier = ?", identifier);
      queryObj:SetValue("_Blacklists", serializedTable);
      queryObj:Push();
    end;
  end;
end;
  RETRIEVE_TABLES();
end;
