--[[-----------------
	Coded by Duck
-----------------]]--

local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("PlyForceChar");
COMMAND.tip = "Force a player to use a certain character.";
COMMAND.text = "<string Name> <number CharacterID>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 2;
COMMAND.access = "s";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local echo = Clockwork.config:Get("admin_echoes"):Get()
	if (target) then
		local ID = tostring(arguments[2]);
		if (ID) then
			if (tonumber(ID)) then
				local characters = target:GetCharacters();
				for k, v in pairs(characters) do
					if (tostring(v.characterID) == ID) then
						target:Notify(player:Name().." has forced you to use this character ("..v.name..").");
						player:Notify(target:Name().." has been forced to use "..v.name..".");
						if (echo) then
							Clockwork.player:NotifyAll(player:Name().." has forced "..target:Name().." to use "..v.name..".")
						end;

						Clockwork.kernel:PrintLog(LOGTYPE_CRITICAL, player:Name().." has forced "..target:Name().." to use "..v.name..".");
						Clockwork.player:LoadCharacter(target, v.characterID, nil, nil, true);
						--[[ No need to continue the loop once we've found our match --]]
						break;
					end;
				end;
			else
				player:Notify(arguments[2].." isn't a number!")
			end;
		else
			player:Notify("You didn't enter a valid ID!")
		end;
	else
		player:Notify(arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();