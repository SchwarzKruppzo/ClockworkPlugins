---Do not mess with any of the code below.
function PLUGIN:GetPlayerDefaultModel(player)
	local faction = player:GetFaction();
	if (Schema:IsCombineFaction(faction)) then
		for y = 0, (noOfDivisions - 1) do
			for x = 0, (noOfRanks - 1) do
				if(string.find(player:Name(), Ranks[x]) and Schema:IsPlayerCombineRank(player, Division[y])) then
					return Models[Division[y]..Ranks[x].."mdl"];
				end;
			end;
		end;
		if(noOfEliteDivisions > 0) then
			for y = 0, (noOfEliteDivisions - 1) do
				for x = 0, (noOfEliteRanks - 1) do
					if(string.find(player:Name(), EliteRanks[x]) and Schema:IsPlayerCombineRank(player, EliteDivisions[y])) then
						return EliteModels[EliteDivisions[y]..EliteRanks[x].."mdl"];
					end;
				end;
			end;
		end;
		for x = 0, (noOfOTADivs - 1) do
			if(string.find(player:Name(), OTADivs[x])) then
				return OTAModels["OTA-"..OTADivs[x].."mdl"];
			end;
		end;
		for x = 0, (noOfHRRanks - 1) do
			if(string.find(player:Name(), HRRanks[x])) then
				return HRModels[HRRanks[x].."mdl"];
			end;
		end;
	end;
end;

function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (Schema:IsCombineFaction(faction)) then
		for y = 0, (noOfDivisions - 1) do
			for x = 0, (noOfRanks - 1) do
				if(string.find(player:Name(), Ranks[x]) and Schema:IsPlayerCombineRank(player, Division[y])) then
					player:SetModel(Models[Division[y]..Ranks[x].."mdl"]);
					return;
				end;
			end;
		end;
		if(noOfEliteDivisions > 0) then
			for y = 0, (noOfEliteDivisions - 1) do
				for x = 0, (noOfEliteRanks - 1) do
					if(string.find(player:Name(), EliteRanks[x]) and Schema:IsPlayerCombineRank(player, EliteDivisions[y])) then
						player:SetModel(EliteModels[EliteDivisions[y]..EliteRanks[x].."mdl"]);
						return;
					end;
				end;
			end;
		end;
		for x = 0, (noOfOTADivs - 1) do
			if(string.find(player:Name(), OTADivs[x])) then
				player:SetModel(OTAModels["OTA-"..OTADivs[x].."mdl"]);
				return;
			end;
		end;
		for x = 0, (noOfHRRanks - 1) do
			if(string.find(player:Name(), HRRanks[x])) then
				player:SetModel(HRModels[HRRanks[x].."mdl"]);
				return;
			end;
		end;
	end;
end;

function PLUGIN:PlayerNameChanged(player, previousName, newName)
	if (Schema:IsCombineFaction(faction)) then
		for y = 0, (noOfDivisions - 1) do
			for x = 0, (noOfRanks - 1) do
				if(string.find(player:Name(), Ranks[x]) and Schema:IsPlayerCombineRank(player, Division[y])) then
					player:SetModel(Models[Division[y]..Ranks[x].."mdl"]);
					return;
				end;
			end;
		end;
		if(noOfEliteDivisions > 0) then
			for y = 0, (noOfEliteDivisions - 1) do
				for x = 0, (noOfEliteRanks - 1) do
					if(string.find(player:Name(), EliteRanks[x]) and Schema:IsPlayerCombineRank(player, EliteDivisions[y])) then
						player:SetModel(EliteModels[EliteDivisions[y]..EliteRanks[x].."mdl"]);
						return;
					end;
				end;
			end;
		end;
		for x = 0, (noOfOTADivs - 1) do
			if(string.find(player:Name(), OTADivs[x])) then
				player:SetModel(OTAModels["OTA-"..OTADivs[x].."mdl"]);
				return;
			end;
		end;
		for x = 0, (noOfHRRanks - 1) do
			if(string.find(player:Name(), HRRanks[x])) then
				player:SetModel(HRModels[HRRanks[x].."mdl"]);
				return;
			end;
		end;
	end;
end;

function PLUGIN:PlayerAdjustCharacterScreenInfo(player, character, info)
	if (Schema:IsCombineFaction(info.faction)) then
		for y = 0, (noOfDivisions - 1) do
			for x = 0, (noOfRanks - 1) do
				if(string.find(player:Name(), Ranks[x]) and Schema:IsPlayerCombineRank(player, Division[y])) then
					info.model = Models[Division[y]..Ranks[x].."mdl"];
					return;
				end;
			end;
		end;
		if(noOfEliteDivisions > 0) then
			for y = 0, (noOfEliteDivisions - 1) do
				for x = 0, (noOfEliteRanks - 1) do
					if(string.find(player:Name(), EliteRanks[x]) and Schema:IsPlayerCombineRank(player, EliteDivisions[y])) then
						info.model = EliteModels[EliteDivisions[y]..EliteRanks[x].."mdl"];
						return;
					end;
				end;
			end;
		end;
		for x = 0, (noOfOTADivs - 1) do
			if(string.find(player:Name(), OTADivs[x])) then
				info.model = OTAModels["OTA-"..OTADivs[x].."mdl"];
				return;
			end;
		end;
		for x = 0, (noOfHRRanks - 1) do
			if(string.find(player:Name(), HRRanks[x])) then
				info.model = HRModels[HRRanks[x].."mdl"];
				return;
			end;
		end;
	end;
end;