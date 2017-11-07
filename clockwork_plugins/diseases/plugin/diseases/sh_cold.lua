local DISEASE = Clockwork.disease:New("Cold");
DISEASE.description = "A regular cold, generally not dangerous at all.";
DISEASE.incubationTime = 5;
DISEASE.infectuous = true;
DISEASE.immuneFactions = {"Metropolice Force", "Overwatch Transhuman Arm"};
DISEASE.transmissionType = "hybrid";
DISEASE.severity = 40;
DISEASE.lethality = 0;

function DISEASE:OnTemporaryEffect(player)
	player:EmitSound("ambient/voices/cough"..math.random(1, 4)..".wav");
end;

DISEASE:Register();