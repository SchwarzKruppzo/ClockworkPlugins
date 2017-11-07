local Clockwork = Clockwork;

function cwDiseases:Think()
	local CT = CurTime();
	local OT = os.time();

	for k, v in pairs(player.GetAll()) do
		if (v:HasInitialized() and v:Alive()) then
			if (v:GetCharacterData("diseaseInfo")) then
				local diseaseInfo = v:GetCharacterData("diseaseInfo");
				local infectionProtection = 0;

				if (table.Count(diseaseInfo.diseases) > 0) then
					for k2, v2 in RandomPairs(diseaseInfo.diseases) do
						if !(Clockwork.config:Get("diseases_lethality_override")) then
							if (v2.lethality > 0 and !v2.incubating) then
								if !(v.nextLethalityAffect) then
									v.nextLethalityAffect = CT + Clockwork.config:Get("diseases_lethality_interval"):Get()*60;
								end;

								if (CT > v.nextLethalityAffect) then
									v.nextLethalityAffect = nil;
									local damage = math.floor((v2.lethality/100)*5+1);

									v:SetHealth(v:Health() - damage);
									Clockwork.plugin:Call("OnPlayerTakeDiseaseDamage", v, damage, Clockwork.disease:GetTableVersion(v2));
								end;
							end;
						end;

						if (v2.infectuous) then
							if (v2.transmissionType == "contact" or v2.transmissionType == "hybrid") then
								for k3, v3 in pairs(player.GetAll()) do
									if (v3:GetPos():Distance(v:GetPos()) <= Clockwork.config:Get("diseases_contact_radius"):Get()) then
										if !(v3 == v) then
											Clockwork.disease:ContactTimer(v, v3, Clockwork.config:Get("diseases_contact_time_limit"):Get()*60, Clockwork.config:Get("diseases_contact_radius"):Get(), function()
												if (player:Alive() and v3:Alive()) then
													return true;
												end;
											end, function(success)
												if (success) then
													if !(v3.nextContactInfectChance) then
														v3.nextContactInfectChance = CT + Clockwork.config:Get("diseases_contact_infect_interval"):Get()*60;
													end

													if (CT >= v3.nextContactInfectChance) then
														v3.nextContactInfectChance = nil;

														if (v3:GetCharacterData("diseaseInfo")) then
															local diseaseInfo2 = v3:GetCharacterData("diseaseInfo");
															infectionProtection = Clockwork.disease:GetInfectionProtection(v3);

															if !(diseaseInfo2.diseases[k2] or diseaseInfo2.immunities[k2] or infectionProtection == 1) then
																local infectionChance = math.Clamp((Clockwork.config:Get("diseases_base_infection_chance"):Get() - v3:Health()/10 - infectionProtection*10)/100, 0, 0.9);

																if math.random() < infectionChance then
																	Clockwork.disease:InfectPlayer(v3, k2);
																end;
															end;
														else
															Clockwork.disease:EstablishPlayerDiseaseInfo(v3);
														end;
													end;
												end;
											end);
										end;
									end;
								end;
							end;
						end;
					end;
				end;

				local diseases = Clockwork.disease:GetAll();

				for k2, v2 in RandomPairs(diseases) do
					if (v2.infectuous) then
						if !(diseaseInfo.diseases[k2] or diseaseInfo.immunities[k2]) then
							if (v2.transmissionType == "airborne" or v2.transmissionType == "hybrid") then
								if !(v.nextAirborneInfectChance) then
									v.nextAirborneInfectChance = CT + Clockwork.config:Get("diseases_airborne_infect_interval"):Get()*60;
								end;

								if (CT >= v.nextAirborneInfectChance) then
									v.nextAirborneInfectChance = nil;
									infectionProtection = Clockwork.disease:GetInfectionProtection(v);

									local infectionChance = math.Clamp((Clockwork.config:Get("diseases_base_infection_chance"):Get() - v:Health()/10 - infectionProtection*10)/100, 0, 0.9);

									if math.random() <= infectionChance then
										Clockwork.disease:InfectPlayer(v, k2);
									end;
								end;
							elseif (v2.transmissionType == "contact") then
								local anyoneInfected = false;

								for k3, v3 in pairs(player.GetAll()) do
									if Clockwork.disease:IsPlayerSickWith(v3, k2) then
										anyoneInfected = true;
									end;
								end;

								if !(anyoneInfected) then
									Clockwork.disease:InfectPlayer(table.Random(player.GetAll()), k2);
								end;
							end;
						end;
					end;
				end;

				if (table.Count(diseaseInfo.diseases) > 0) then
					for k2, v2 in pairs(diseaseInfo.diseases) do
						if (v2.incubating) then
							if !(v2.trueIncubationTime) then
								v2.trueIncubationTime = OT + v2.incubationTime;
								v:SetCharacterData("diseaseInfo", diseaseInfo);
							end;

							if (OT > v2.trueIncubationTime) then
								Clockwork.disease:EndIncubation(v, k2);
							end;

							return;
						end;

						if (v2.PersistEffect) then
							Clockwork.disease:DoPersistEffect(v, k2);
						end;

						if (v2.OnTemporaryEffect) then
							if !(v.nextDiseaseTempEffect) then
								v.nextDiseaseTempEffect = CT + math.random(Clockwork.config:Get("diseases_temporary_min"):Get()*60, Clockwork.config:Get("diseases_temporary_max"):Get()*60) / (v2.severity/100*5)+1;
							end;

							if (CT > v.nextDiseaseTempEffect) then
								v.nextDiseaseTempEffect = nil;
								Clockwork.disease:TriggerTempEffect(v, k2);
							end;
						end;

						if !(v2.chronic) then
							if !(v2.sickTime) then
								v2.sickTime = OT + math.random(Clockwork.config:Get("diseases_sick_time_min"):Get()*3600, Clockwork.config:Get("diseases_sick_time_max"):Get()*3600);
								if (v2.extraSickTime) then
									v2.sickTime = v2.sickTime + v2.extraSickTime;
								end;
							else
								if (OT >= v2.sickTime) then
									Clockwork.disease:CurePlayer(v, k2);
								end;
							end;
						end;
					end;
				end;
			else
				Clockwork.disease:EstablishPlayerDiseaseInfo(v);
			end;
		end;
	end;
end;

function cwDiseases:PlayerCharacterLoaded(player)
	if !(player:GetCharacterData("diseaseInfo")) then
		Clockwork.disease:EstablishPlayerDiseaseInfo(player);
	end;

	local playerDiseases = Clockwork.disease:GetPlayerDiseases(player);

	if (table.Count(playerDiseases) > 0) then
		for k,v in pairs(playerDiseases) do
			Clockwork.disease:DoDiseaseInit(player, k);
		end;
	end;

	for k, v in pairs(Clockwork.disease:GetAll()) do
		if (table.Count(v.immuneFactions) <= 0) then return; end;
		for k2, v2 in pairs(v.immuneFactions) do
			if (string.lower(v2) == string.lower(player:GetFaction())) then
				Clockwork.disease:MakePlayerImmune(player, k);
			end;
		end;
	end;
end;

function cwDiseases:PlayerCharacterUnloaded(player)
	local playerDiseases = Clockwork.disease:GetPlayerDiseases(player);

	if (table.Count(playerDiseases) > 0) then
		for k,v in pairs(playerDiseases) do
			Clockwork.disease:DoDiseaseUnload(player, k);
		end;
	end;
end;

function cwDiseases:PlayerDeath(player)
	Clockwork.disease:MakePlayerHealthy(player);
	Clockwork.disease:WipePlayerImmunities(player);
end;

-- Called when a player takes damage from a disease.
function Clockwork:OnPlayerTakeDiseaseDamage(player, damageAmount, diseaseInfo) end;