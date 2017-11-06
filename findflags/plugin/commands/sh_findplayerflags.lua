

local COMMAND = Clockwork.command:New("FindAllFlags");
COMMAND.tip = "Prints all the characters with specified flags";
COMMAND.access = "o";
COMMAND.text = "<string Flags>";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)

local flags = tostring(arguments[1]);

local t = {};
local flagpeeps = {};
flags:gsub(".", function(flags) table.insert(t, flags) end);

Clockwork.player:Notify(player, "Characters with the flags " .. flags);
		for k, v in pairs(_player.GetAll()) do
			local pFlags =	v:GetFlags();
			local flagsStr = "";

			for h, j in pairs(t) do
				if (string.match(pFlags, j)) then
					flagsStr = flagsStr .. j;
				end;
			end;

			if(flagsStr != "") then
				Clockwork.player:Notify(player, "" .. v:Name() .. " has " .. "'" .. flagsStr .. "'" );
			end;
		end;
	--Clockwork.player:Notify(player, "List printed to console."); // Once I figure it out.
end;

COMMAND:Register();
