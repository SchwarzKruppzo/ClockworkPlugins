-- Called when time has passed.
function PLUGIN:TimePassed(quantity)
   if (quantity == TIME_MINUTE) then
      self:SyncDayNight();
   end;
end;
