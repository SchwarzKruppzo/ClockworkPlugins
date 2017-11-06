local PLUGIN = PLUGIN;

function PLUGIN:Tick()

  if(#player.GetAll() == 0) then return; end;

    for k, v in pairs(player.GetAll()) do
      local playerMan = v;
      local table = v:GetCharacters();

      for k2, v2 in pairs(table) do
        if(v2.data["CharTempBanned"]) then
          if(os.time() >= v2.data["CharBanTime"]) then
            if(v:Name() == v2.name) then
              print("unbanning the dude " .. v2.name);
              PLUGIN:SetTempBanned(v, false, 0);
            else
              v2.data["CharTempBanned"] = false;
              print("unbanning the dude " .. v2.name);
            end;

            local charactersTable = Clockwork.config:Get("mysql_characters_table"):Get();
            local charName = v2.name;

            local queryObj = Clockwork.database:Select(charactersTable);
            queryObj:SetCallback(function(result)
              if (Clockwork.database:IsResult(result)) then
              local queryObj = Clockwork.database:Update(charactersTable);
              queryObj:Replace("_Data", "\"CharBanned\":true", "\"CharBanned\":false");
              queryObj:AddWhere("_Name = ?", charName);
              queryObj:Replace("_Data", "\"CharTempBanned\":true", "\"CharTempBanned\":false");
              queryObj:AddWhere("_Name = ?", charName);
              queryObj:Push();
            end;
          end);
          queryObj:AddWhere("_Name = ?", charName);
          queryObj:Pull();
          if(v:HasInitialized()) then
          Clockwork.player:Notify(v, "Your character " .. v2.name .. " has been unbanned.");
        end;
        end;
      end;
    end;
  end;
end;
