local PLUGIN = PLUGIN;

-- Called to get the screen text info.
function PLUGIN:GetScreenTextInfo()
  local blackFadeAlpha = Clockwork.kernel:GetBlackFadeAlpha();

  local hours = Clockwork.Client:GetSharedVar("CharBanTime") / 60;
  if (Clockwork.Client:GetSharedVar("CharTempBanned")) then
    return {
      alpha = blackFadeAlpha,
      title = "THIS CHARACTER IS BANNED FOR " .. hours .. " MORE HOURS.",
      text = "Go to the characters menu to make a new one."
    };
  end;
end;
