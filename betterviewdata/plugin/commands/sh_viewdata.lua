local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("ViewData");
COMMAND.tip = "View data about a given character.";
COMMAND.text = "<string Name|CID>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		local target = Clockwork.player:FindByID( arguments[1] );

		if (not target) then
			for k, v in pairs(_player.GetAll()) do
				if (v:GetCharacterData("citizenid") == arguments[1]) then
					target = v;
				end;
			end;
		end;

		if (target) then
			if (player != target or player:IsAdmin()) then
            local data = target:GetCharacterData( "combinedata" );

            if (data == nil or (type(data) == "string" and string.len(data) == 0)) then
      			target:SetCharacterData("combinedata", PLUGIN.defaultCharData);
      		end;

				Clockwork.datastream:Start( player, "EditData", { target, target:GetCharacterData("combinedata") or "", target:GetCharacterData("combinepoints") or {}, target:GetCharacterData("citizenid") or "" } );

				player.editDataAuthorised = target;
			else
				Clockwork.player:Notify(player, "You cannot view or edit your own data!");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid character or CID!");
		end;
	else
		Clockwork.player:Notify(player, "You are not the Combine!");
	end;
end;

COMMAND:Register();
