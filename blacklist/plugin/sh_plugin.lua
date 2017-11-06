local PLUGIN = PLUGIN;

Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");


function PLUGIN:IsBlacklisted(player, faction)
  local blackFaction = Clockwork.faction:FindByID(faction);
  local table = {};
  local blacklistTable = Clockwork.config:Get("mysql_blacklist_table"):Get();

  if(IsValid(player)) then
    if(blackFaction) then
      local queryObj = Clockwork.database:Select(blacklistTable);
      queryObj:AddWhere("_Schema = ?", schemaFolder);
      queryObj:AddWhere("_SteamID = ?", steamID);
      queryObj:SetCallback(function(result)
        if(IsValid(player)) then
        return;
      end;

      if(Clockwork.database:IsResult(result)) then
        table = result[1]._Blacklists;
      end;
    end);
    queryObj:Pull();
  end;
end;
for k, v in pairs(table) do
  if(blackFaction == v) then
    return true;
  end;
end;
return false;
end;
