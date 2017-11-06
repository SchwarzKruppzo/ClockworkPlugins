local COMMAND = Clockwork.command:New("Freqlist");
COMMAND.tip = "List the frequencies of all players.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	-- Create an array of all players with their frequencies
	local frequencies = {};
	for k, v in pairs(_player.GetAll()) do
		if(IsValid(v) and v:HasInitialized()) then
			local playerfreq = v:GetCharacterData("frequency");
			if(playerfreq ~= nil) then
				if(frequencies[playerfreq] == nil) then
					frequencies[playerfreq] = {};
				end;
				table.insert(frequencies[playerfreq], v:Name());
			end;
		end;
	end;
	local text = "";
	--Create a string with all the frequencies with their players
	for k, v in pairs(frequencies) do
		text = text .. "\n " .. k .. ": ";
		for k2, v2 in pairs(v) do
			text = text .. "(" .. v2 .. ") ";
		end;
	end;


	Clockwork.player:Notify(player, text)

end;

COMMAND:Register();