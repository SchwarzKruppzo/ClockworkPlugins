local Clockwork = Clockwork;

-- Called when a player has their disease info established.
function Clockwork:PlayerDiseaseInfoEstablished(player, characterDiseaseInfo) end;

-- Called when a player is infected with a disease.
function Clockwork:OnPlayerInfected(player, diseaseInfo) end;

-- Called when a player's disease's incubation period ends.
function Clockwork:OnDiseaseIncubationEnd(player, diseaseInfo) end;

-- Called when a player experiences a temporary effect from a disease.
function Clockwork:OnPlayerExperienceDiseaseTempEffect(player, diseaseInfo) end;