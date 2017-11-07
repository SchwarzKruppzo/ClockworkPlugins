local div;
local rank;
local ITEM;
for x = 0, (noOfDivisions - 1) do
	div = Division[x];
	for y = 0, (noOfRanks - 1) do
		rank = Ranks[y];
		if(!Clockwork.item:FindByID(div.."_"..rank.."_Uniform")) then
			ITEM = Clockwork.item:New("clothes_base");
			ITEM.name = div.." "..rank.." Uniform";
		else
			ITEM = Clockwork.item:FindByID(div.."_"..rank.."_Uniform");
		end
		ITEM.cost = 2000;
		ITEM.access = "m";
		ITEM.weight = 5;
		ITEM.business = false;
		ITEM.description = "The uniform of a "..div.." "..rank;
		function ITEM:GetReplacement(player)
			return Models[Division[x]..Ranks[y].."mdl"];
		end;
		ITEM:Register();
	end;
end;
for x = 0, (noOfEliteDivisions - 1) do
	div = EliteDivisions[x];
	for y = 0, (noOfEliteRanks - 1) do
		rank = EliteRanks[y];
		if(!Clockwork.item:FindByID(div.."_"..rank.."_Uniform")) then
			ITEM = Clockwork.item:New("clothes_base");
			ITEM.name = div.." "..rank.." Uniform";
		else
			ITEM = Clockwork.item:FindByID(div.."_"..rank.."_Uniform");
		end;
		ITEM.cost = 2000;
		ITEM.access = "m";
		ITEM.weight = 5;
		ITEM.business = false;
		ITEM.description = "The uniform of a "..div.." "..rank;
		function ITEM:GetReplacement(player)
			return EliteModels[EliteDivisions[x]..EliteRanks[y].."mdl"];
		end;
		ITEM:Register();
	end
end
for x = 0, (noOfOTADivs - 1) do
	division = OTADivs[x];
	if(!Clockwork.item:FindByID("OTA_"..rank.."_Uniform")) then
		ITEM = Clockwork.item:New("clothes_base");
		ITEM.name = "OTA "..rank.." Uniform";
	else
		ITEM = Clockwork.item:FindByID("OTA_"..division.."_Uniform");
	end
	ITEM.cost = 3000;
	ITEM.access = "m";
	ITEM.weight = 5;
	ITEM.business = false;
	ITEM.description = "The uniform of an OTA "..rank;
	function ITEM:GetReplacement(player)
		return OTAModels["OTA-"..division.."mdl"];
	end;
	ITEM:Register();
end