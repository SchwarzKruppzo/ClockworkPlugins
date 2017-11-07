--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local PLUGIN = PLUGIN;

PLUGIN:SetGlobalAlias("AtomicSWEPS");

if (SERVER) then
	resource.AddWorkshop("455435228");
	resource.AddWorkshop("202591756");
	resource.AddWorkshop("202590506");
end;

function AtomicSWEPS:Initialize()
    local bos = Clockwork.faction:FindByID("Brotherhood of Steel");
    local startingInv = {
        ["Laser Pistol"] = 1,
        ["Laser Rifle"] = 1,
        ["Microfusion Cells"] = 2,
        ["Energy Cells"] = 2,
    };

    if (bos) then
        for k, v in pairs(startingInv) do
            bos.startingInv[k] = v;
        end;
    end;

    local cc = Clockwork.faction:FindByID("Crimson Caravan");

    startingInv = {
        ["Chinese Assault Rifle"] = 1,
        ["10mm Pistol"] = 1,
        ["10mm Rounds"] = 2,
        ["5.56mm Rounds"] = 2
    };

    if (cc) then
        for k, v in pairs(startingInv) do
            cc.startingInv[k] = v;
        end;
    end;

    local enclave = Clockwork.faction:FindByID("Enclave");

    startingInv = {
        ["Plasma Pistol"] = 1,
        ["Plasma Rifle"] = 1,
        ["Microfusion Cells"] = 2,
        ["Energy Cells"] = 2,
    };

    if (enclave) then
        for k, v in pairs(startingInv) do
            enclave.startingInv[k] = v;
        end;
    end;

    local legion = Clockwork.faction:FindByID("Caesar's Legion");

    startingInv = {
        ["Combat Shotgun"] = 1,
        [".32 Pistol"] = 1,
        ["handheld_radio"] = 1,
        [".32 Rounds"] = 2,
        ["12 Gauge Rounds"] = 2
    };

    if (legion) then
        for k, v in pairs(startingInv) do
            legion.startingInv[k] = v;
        end;
    end;

    local ncr = Clockwork.faction:FindByID("New California Republic");

    startingInv = {
        ["Battle Rifle"] = 1,
        ["10mm Pistol"] = 1,
        ["10mm Rounds"] = 2,
        [".308 Rounds"] = 2
    };

    if (ncr) then
        for k, v in pairs(startingInv) do
            ncr.startingInv[k] = v;
        end;
    end;

    local raider = Clockwork.faction:FindByID("Raider");

    startingInv = {
        ["Hunting Shotgun"] = 1,
        [".44 Revolver"] = 1,
        [".44 Rounds"] = 2,
        ["12 Gauge Rounds"] = 2
    };

    if (raider) then
        for k, v in pairs(startingInv) do
            raider.startingInv[k] = v;
        end;
    end;
end;