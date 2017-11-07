local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called to check if the client does have a flag.
function PLUGIN:PlayerDoesHaveFlag(player, flag)
        return self:HasTempFlag(player, flag);
end;

-- Called when a player's scoreboard options are needed.
function PLUGIN:GetPlayerScoreboardOptions(player, options, menu)
        local plyWarn = Clockwork.command:FindByID("PlyWarn");
        local plySlay = Clockwork.command:FindByID("PlySlay");
        local plyFreeze = Clockwork.command:FindByID("PlyFreeze");
        local plySilence = Clockwork.command:FindByID("PlySilence");
        local plyGod = Clockwork.command:FindByID("PlyGod");
        local plyMute = Clockwork.command:FindByID("PlyMute");
        local plyGimp = Clockwork.command:FindByID("PlyGimp");
        local plyRespawn = Clockwork.command:FindByID("Respawn");
        local plyForceChar = Clockwork.command:FindByID("PlyForceChar");
        
        if (plyWarn and Clockwork.player:HasFlags(Clockwork.Client, plyWarn.access)) then
                options["Warn"] = function()
                        Derma_StringRequest(player:Name(), "What is the reason for this warning?", nil, function(text)
                                Clockwork.kernel:RunCommand("PlyWarn", player:Name(), text);
                        end);
                end;
        end;

        if (plyForceChar and Clockwork.player:HasFlags(Clockwork.Client, plyForceChar.access)) then
                if (CW_MASTER_MANIFEST) then
                        options["Force Character"] = {};
                        for k, v in pairs(CW_MASTER_MANIFEST) do
                                if (player:SteamID() == v.steamID) then
                                        options["Force Character"][v.name] = function()
                                                Clockwork.kernel:RunCommand("PlyForceChar", player:Name(), tostring(v.characterID));
                                        end;
                                end;
                        end;
                end;
        end;

        if (plySlay and Clockwork.player:HasFlags(Clockwork.Client, plySlay.access)) then
                options["Slay"] = {};

                options["Slay"]["Normal"] = function()
                        Clockwork.kernel:RunCommand("PlySlay", player:Name());
                end;

                options["Slay"]["Silent"] = function()
                        Clockwork.kernel:RunCommand("PlySilentSlay", player:Name());
                end;
        end;

        if (plyRespawn and Clockwork.player:HasFlags(Clockwork.Client, plyRespawn.access)) then
                options["Respawn"] = {};

                options["Respawn"]["Normal"] = function()
                        Clockwork.kernel:RunCommand("Respawn", player:Name());
                end;

                options["Respawn"]["Stay"] = function()
                        Clockwork.kernel:RunCommand("RespawnStay", player:Name());
                end;

                options["Respawn"]["Bring"] = function()
                        Clockwork.kernel:RunCommand("RespawnBring", player:Name());
                end;
        end;

        if (plyFreeze and Clockwork.player:HasFlags(Clockwork.Client, plyFreeze.access)) then
                if (player:IsFrozen()) then
                        options["Unfreeze"] = function()
                                Clockwork.kernel:RunCommand("PlyFreeze", player:Name());
                        end;
                else
                        options["Freeze"] = function()
                                Clockwork.kernel:RunCommand("PlyFreeze", player:Name());
                        end;
                end;
        end;

        if (plySilence and Clockwork.player:HasFlags(Clockwork.Client, plySilence.access)) then
                if (CW_MASTER_MANIFEST) then
                        for k, v in pairs(CW_MASTER_MANIFEST) do
                                if (player:SteamID() == v.steamID) then
                                        if (v.silenced) then
                                                options["Unsilence"] = function()
                                                        Clockwork.kernel:RunCommand("PlySilence", player:Name());
                                                end;
                                        else
                                                options["Silence"] = function()
                                                        Clockwork.kernel:RunCommand("PlySilence", player:Name());
                                                end;
                                        end;
                                end
                        end;
                end;
        end;

        if (plyGod and Clockwork.player:HasFlags(Clockwork.Client, plyGod.access)) then
                if (CW_MASTER_MANIFEST) then
                        for k, v in pairs(CW_MASTER_MANIFEST) do
                                if (player:SteamID() == v.steamID) then
                                        if (v.godded) then
                                                options["Ungod"] = function()
                                                        Clockwork.kernel:RunCommand("PlyGod", player:Name());
                                                end;
                                        else
                                                options["God"] = function()
                                                        Clockwork.kernel:RunCommand("PlyGod", player:Name());
                                                end;
                                        end;
                                end;
                        end;
                end;
        end;

        if (plyGimp and Clockwork.player:HasFlags(Clockwork.Client, plyGimp.access)) then
                if (CW_MASTER_MANIFEST) then
                        for k, v in pairs(CW_MASTER_MANIFEST) do
                                if (player:SteamID() == v.steamID) then
                                        if (v.gimped) then
                                                options["Ungimp"] = function()
                                                        Clockwork.kernel:RunCommand("PlyGimp", player:Name());
                                                end;
                                        else
                                                options["Gimp"] = function()
                                                        Clockwork.kernel:RunCommand("PlyGimp", player:Name());
                                                end;
                                        end;
                                end;
                        end
                end;
        end;

        if (plyMute and Clockwork.player:HasFlags(Clockwork.Client, plyMute.access)) then
                options["Mute/Unmute"] = {};
                options["Mute/Unmute"]["Everything"] = function()
                        Clockwork.kernel:RunCommand("PlyMute", player:Name());
                end;
                options["Mute/Unmute"]["OOC"] = function()
                        Clockwork.kernel:RunCommand("PlyMuteOOC", player:Name());
                end;
                options["Mute/Unmute"]["GOOC"] = function()
                        Clockwork.kernel:RunCommand("PlyMuteGOOC", player:Name());
                end;
                options["Mute/Unmute"]["LOOC"] = function()
                        Clockwork.kernel:RunCommand("PlyMuteLOOC", player:Name());
                end;
                options["Mute/Unmute"]["IC"] = function()
                        Clockwork.kernel:RunCommand("PlyMuteIC", player:Name());
                end;
        end;
end;

-- Called each frame.
function PLUGIN:Think()
        local curTime = CurTime();
        
        if (!scoreboard) then
                scoreboard = vgui.Create("cwScoreboard");
                scoreboard:SetSize(Clockwork.menu:GetWidth(), Clockwork.menu:GetHeight());
                scoreboard:SetPos(ScrW() / 2 - scoreboard:GetWide() / 2, ScrH() / 2 - scoreboard:GetTall() / 2);
                scoreboard:SetVisible(false);
        end;

        if (!Clockwork.chatBox:IsOpen()) then
                if (input.IsKeyDown(KEY_LSHIFT) and input.IsKeyDown(KEY_B)) then
                        if (scoreboard:IsVisible()) then
                                if (!nextscoreboard or curTime > nextscoreboard) then
                                        scoreboard:SetVisible(false);
                                        gui.EnableScreenClicker(false);
                                        nextscoreboard = curTime + 1;
                                end;
                        else
                                if (Clockwork.player:IsAdmin(Clockwork.Client)) then
                                        Clockwork.datastream:Start("ReqAllChars");
                                end;
                                
                                if (!nextscoreboard or curTime > nextscoreboard) then
                                        scoreboard:Rebuild();
                                        scoreboard:SetVisible(true);
                                        gui.EnableScreenClicker(true);
                                        nextscoreboard = curTime + 1;
                                end;
                        end;
                end;
        end;
end;

Clockwork.datastream:Hook("RecAllChars", function(data)
        CW_MASTER_MANIFEST = data;
end);
