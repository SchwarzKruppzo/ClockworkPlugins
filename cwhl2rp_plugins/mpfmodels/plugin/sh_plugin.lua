-------------------------------GROUND UNITS + HIGH COMMAND-------------------------------
--Ranks table, edit the ranks as necessary however if you change the number of ranks then more changing will be required.
--(Add to the models table)
Ranks = {};
Ranks[0] = "i5"; --Considered "first rank" in my commenting.
Ranks[1] = "i4";
Ranks[2] = "i3";
Ranks[3] = "i2";
Ranks[4] = "i1";
Ranks[5] = "EpU";
Ranks[6] = "OfC";
Ranks[7] = "SqL";
Ranks[8] = "DvL";


--Divisions table, edit them as necessary however changing the number of divisions will cause more changing to be required
--(Add to the models table)
Division = {};
Division[0] = "JUDGE";--Considered "first division" in my commenting.
Division[1] = "HELIX";
Division[2] = "UNION";
Division[3] = "GRID";


--The models table, setting each model for each rank of each division.
Models = {};
Models[Division[0]..Ranks[0].."mdl"] = ""; --First division's first rank model path.
Models[Division[0]..Ranks[1].."mdl"] = ""; --First division's second rank model path.
Models[Division[0]..Ranks[2].."mdl"] = ""; --First division's third rank path.
Models[Division[0]..Ranks[3].."mdl"] = ""; --First division's fourth rank path.
Models[Division[0]..Ranks[4].."mdl"] = ""; --First division's fifth rank model path.
Models[Division[0]..Ranks[5].."mdl"] = ""; --First division's sixth rank model path.
Models[Division[0]..Ranks[6].."mdl"] = ""; --First division's seventh rank model path.
Models[Division[0]..Ranks[7].."mdl"] = ""; --First division's eigth rank model path.
Models[Division[0]..Ranks[8].."mdl"] = ""; --First division's ninth rank model path.
Models[Division[1]..Ranks[0].."mdl"] = ""; --Second division's first rank model path.
Models[Division[1]..Ranks[1].."mdl"] = ""; --Second division's second rank model path.
Models[Division[1]..Ranks[2].."mdl"] = ""; --Second division's third rank path.
Models[Division[1]..Ranks[3].."mdl"] = ""; --Second division's fourth rank path.
Models[Division[1]..Ranks[4].."mdl"] = ""; --Second division's fifth rank model path.
Models[Division[1]..Ranks[5].."mdl"] = ""; --Second division's sixth rank model path.
Models[Division[1]..Ranks[6].."mdl"] = ""; --Second division's seventh rank model path.
Models[Division[1]..Ranks[7].."mdl"] = ""; --Second division's eigth rank model path.
Models[Division[1]..Ranks[8].."mdl"] = ""; --Second division's ninth rank model path.
Models[Division[2]..Ranks[0].."mdl"] = ""; --Third division's first rank model path.
Models[Division[2]..Ranks[1].."mdl"] = ""; --Third division's second rank model path.
Models[Division[2]..Ranks[2].."mdl"] = ""; --Third division's third rank path.
Models[Division[2]..Ranks[3].."mdl"] = ""; --Third division's fourth rank path.
Models[Division[2]..Ranks[4].."mdl"] = ""; --Third division's fifth rank model path.
Models[Division[2]..Ranks[5].."mdl"] = ""; --Third division's sixth rank model path.
Models[Division[2]..Ranks[6].."mdl"] = ""; --Third division's seventh rank model path.
Models[Division[2]..Ranks[7].."mdl"] = ""; --Third division's eigth rank model path.
Models[Division[2]..Ranks[8].."mdl"] = ""; --Third division's ninth rank model path.
Models[Division[3]..Ranks[0].."mdl"] = ""; --Fourth division's first rank model path.
Models[Division[3]..Ranks[1].."mdl"] = ""; --Fourth division's second rank model path.
Models[Division[3]..Ranks[2].."mdl"] = ""; --Fourth division's third rank path.
Models[Division[3]..Ranks[3].."mdl"] = ""; --Fourth division's fourth rank path.
Models[Division[3]..Ranks[4].."mdl"] = ""; --Fourth division's fifth rank model path.
Models[Division[3]..Ranks[5].."mdl"] = ""; --Fourth division's sixth rank model path.
Models[Division[3]..Ranks[6].."mdl"] = ""; --Fourth division's seventh rank model path.
Models[Division[3]..Ranks[7].."mdl"] = ""; --Fourth division's eigth rank model path.
Models[Division[3]..Ranks[8].."mdl"] = ""; --Fourth division's ninth rank model path.


-------------------------------ELITE DIVISIONS-------------------------------
--Elite ranks table, edit the ranks as necessary however if you change the number of ranks then more changing will be required.
--(Add to the models table)
EliteRanks = {};
EliteRanks[0] = "OfC";
EliteRanks[1] = "SqL";
EliteRanks[2] = "DvL";


--Elite divisions table, edit them as necessary however changing the number of divisions will cause more changing to be required.
--(Add to the models table)
EliteDivisions = {};
EliteDivisions[0] = "GHOST";


--The elite models table, setting each model for each rank of each elite division.
EliteModels = {};
EliteModels[EliteDivisions[0]..EliteRanks[0].."mdl"] = "";
EliteModels[EliteDivisions[0]..EliteRanks[1].."mdl"] = "";
EliteModels[EliteDivisions[0]..EliteRanks[2].."mdl"] = "";


-------------------------------OVERWATCH TRANSHUMAN ARM-------------------------------
--OTA Ranks table, edit the ranks as necessary however if you change the number of ranks then more changing will be required.
--(Add to the models table)
OTADivs = {};
OTADivs[0] = "ECHO";
OTADivs[1] = "KING";
OTADivs[2] = "STORM";
OTADivs[3] = "SPEAR";


--The OTA models table, setting each model for each rank.
OTAModels = {};
OTAModels["OTA-"..OTADivs[0].."mdl"] = "";
OTAModels["OTA-"..OTADivs[1].."mdl"] = "";
OTAModels["OTA-"..OTADivs[2].."mdl"] = "";
OTAModels["OTA-"..OTADivs[3].."mdl"] = "";

-------------------------------HIGHER RANKS (CAA, CA, CmD, SeC)-------------------------------
--HR Ranks table, edit the ranks as necessary however if you change the number of ranks then more changing will be required.
--(Add to the models table)
HRRanks = {};
HRRanks[0] = "CAA";
HRRanks[1] = "CA";
HRRanks[2] = "CmD";
HRRanks[3] = "SeC";


--The HR models table, setting each model for each rank.
HRModels = {};
HRModels[HRRanks[0].."mdl"] = "";
HRModels[HRRanks[1].."mdl"] = "";
HRModels[HRRanks[2].."mdl"] = "";
HRModels[HRRanks[3].."mdl"] = "";


-------------------------------DO NOT EDIT CODE ABOVE-------------------------------

local PLUGIN = PLUGIN;
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

function tablelength(table);
 	local count = 0;
 	for _ in pairs(table) do
 		count = count + 1;
	end;
	return count;
end

noOfDivisions = tablelength(Division);
noOfRanks = tablelength(Ranks);
noOfEliteDivisions = tablelength(EliteDivisions);
noOfEliteRanks = tablelength(EliteRanks);
noOfOTADivs = tablelength(OTADivs);
noOfHRRanks = tablelength(HRRanks);