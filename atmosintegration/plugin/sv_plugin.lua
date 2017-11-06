-- A function to set the atmos time to the Clockwork time.
function PLUGIN:SyncDayNight()
   local atmos = AtmosGlobal;
   if not (atmos) then
      return;
   end;

   if not (Clockwork.config:Get("clockmos_sync"):Get()) then
      return;
   end;

   local minute = Clockwork.time:GetMinute();
   local hour = Clockwork.time:GetHour();

   if hour == 19 and minute == 30 then
      -- For some reason Atmos thinks 19:30 is high-noon.
      -- Hack to avoid high-noon in the middle of the evening.
      -- Fuck Atmos.
      minute = 31;
   end;

   local fHour = hour + (minute / 60);

   -- Make sure atmos is 'paused' (disables its DNC timer).
   if (atmos_paused:GetInt() < 1) then
      atmos_paused:SetInt(1);
   end;

   -- Turn off atmos's realtime system.
   if (atmos_realtime:GetInt() > 0) then
      atmos_realtime:SetInt(0);
   end;

   atmos:SetTime(fHour);

   if (Clockwork.config:Get("clockmos_cloudfix"):Get() and atmos:GetStorming() and IsValid(atmos.m_EnvSkyPaint)) then
      atmos.m_EnvSkyPaint:SetStarTexture("skybox/clouds");
   end;
end;
