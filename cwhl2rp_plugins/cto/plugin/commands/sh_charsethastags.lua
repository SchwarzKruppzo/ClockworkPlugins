local Clockwork = Clockwork;
local cwCTO = cwCTO;

local COMMAND = Clockwork.command:New("CharSetHasTags");
COMMAND.tip = "Set whether a Citizen has CID tags on their clothes.";
COMMAND.text = "<string Name> <bool HasTags>";
COMMAND.access = "o";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local ply = Clockwork.player:FindByID(arguments[1]);

	if (ply) then
		local bEnable = Clockwork.kernel:ToBool(arguments[2]);

		if (bEnable and not ply:GetCharacterData("IsCIDTagGone")) then
			Clockwork.player:Notify(player, ply:Name() .. " already has CID tags!");
		elseif (not bEnable and ply:GetCharacterData("IsCIDTagGone")) then
			Clockwork.player:Notify(player, ply:Name() .. " already has no CID tags!");
		else
			ply:SetCharacterData("IsCIDTagGone", not bEnable);
			Clockwork.player:Notify(player, "You have " .. (bEnable and "added" or "removed") .. " " .. ply:Name() .. "'s CID tags.");
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

COMMAND:Register();
