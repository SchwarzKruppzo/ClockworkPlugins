local PLUGIN = PLUGIN;
local COMMAND = Clockwork.command:New("CharTempBan");
COMMAND.tip = "Bans a character for a set amount of time.";
COMMAND.text = "<string Name> <number Minutes>";
COMMAND.access = "a";
COMMAND.arguments = 2;
function COMMAND:OnRun(player, arguments)
   local target = Clockwork.player:FindByID(arguments[1]);

  local duration = tonumber(arguments[2]);
  print(arguments[1] .. " " .. arguments[2]);

  if(duration == nil) then
    Clockwork.player:Notify(player, "Invalid duration.");
    return;
  end;

  if (target) then
    -- if (!Clockwork.player:IsProtected(target) or Clockwork.player:IsProtected(target)) then
      if(duration > 0) then
        -- local hours = math.floor(duration / 60);
         local seconds = duration * 60;
        local time = os.time() + seconds;
      --print(time .. " " .. os.time());

        if(duration >= 60) then
          PLUGIN:SetTempBanned(target, true, time);
          player:SetSharedVar("CharBanTime", time);
          Clockwork.player:NotifyAll(player:Name() .. " has banned the character '" ..
          target:Name() .. "'' for " .. hours .. " hours.");
          target:KillSilent();

        else
          PLUGIN:SetTempBanned(target, true, time);
          player:SetSharedVar("CharBanTime", time);
          Clockwork.player:NotifyAll(player:Name() .. " has banned the character '" ..
          target:Name() .. "'' for " .. duration .. " minutes.");
          target:KillSilent();

        end;
        -- Clockwork.player:Notify(player, {"PlayerIsProtected", target:Name()});
      -- end;
    else
      Clockwork.player:Notify(player, {"NotValidCharacter", arguments[1]});
    end;
  end;

end;
COMMAND:Register();
