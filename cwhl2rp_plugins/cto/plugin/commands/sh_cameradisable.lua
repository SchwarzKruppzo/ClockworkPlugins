local Clockwork = Clockwork;
local cwCTO = cwCTO;

local COMMAND = Clockwork.command:New("CameraDisable");
COMMAND.tip = "Remotely disable a Combine camera - IDs are shown on the HUD.";
COMMAND.text = "<number CameraID>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		if (Schema:IsPlayerCombineRank( player, {"SCN", "OfC", "EpU", "DvL", "SeC"}, true ) or player:GetFaction() == FACTION_OTA) then
			local camera = Entity(arguments[1]);

			if (not IsEntity(camera) or camera:GetClass() ~= "npc_combine_camera") then
				Clockwork.player:Notify(player, "There is no Combine camera with that ID!");

				return;
			end;

			if (camera:GetSequenceName(camera:GetSequence()) ~= "idlealert") then
				Clockwork.player:Notify(player, "That camera is not currently enabled.");

				return;
			end;

			Clockwork.player:Notify(player, "Disabling C-i" .. camera:EntIndex() .. ".");

			camera:Fire("Disable");
		else
			Clockwork.player:Notify(player, "You are not ranked high enough to use this command!");
		end;
	else
		Clockwork.player:Notify(player, "You are not the Combine!");
	end;
end;

COMMAND:Register();
