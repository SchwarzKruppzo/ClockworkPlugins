local Clockwork = Clockwork;

Clockwork.disease = Clockwork.kernel:NewLibrary("Disease");
Clockwork.disease.stored = {};

local DISEASE = {__index = DISEASE};

-- A function to register a new disease.
function DISEASE:Register()
	Clockwork.disease:Register(self, self.name);
end;

-- A function to set up or reset a player's disease info.
function Clockwork.disease:EstablishPlayerDiseaseInfo(player)
	local diseaseInfo = {};
		diseaseInfo.diseases = {};
		diseaseInfo.immunities = {};

	player:SetCharacterData("diseaseInfo", diseaseInfo);
	Clockwork.plugin:Call("PlayerDiseaseInfoEstablished", player, diseaseInfo);
end;

-- A function to get whether a player is sick or not.
function Clockwork.disease:IsPlayerSick(player)
	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local diseaseInfo = player:GetCharacterData("diseaseInfo");

			if (diseaseInfo.diseases and table.Count(diseaseInfo.diseases) > 0) then
				return true;
			end;
		end;
	end;

	return false;
end;

-- A function to get whether a player is sick with a certain disease or not.
function Clockwork.disease:IsPlayerSickWith(player, diseaseName)
	if !(self.stored[self:uniqueIDFormat(diseaseName)]) then return; end;

	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local diseaseInfo = player:GetCharacterData("diseaseInfo");
			local uniqueID = self:uniqueIDFormat(diseaseName);

			if (diseaseInfo.diseases) then
				if (diseaseInfo.diseases[uniqueID]) then
					return true;
				end;
			end;
		end;
	end;

	return false;
end;

-- A function to set a value for a player's disease info.
function Clockwork.disease:SetDiseaseData(player, key, value)
	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local diseaseInfo = player:GetCharacterData("diseaseInfo");

			if (diseaseInfo[key]) then
				diseaseInfo[key] = value;
			end;
		end;
	end;
end;

-- A function to get a player's disease info.
function Clockwork.disease:GetDiseaseInfo(player)
	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			return player:GetCharacterData("diseaseInfo");
		end;
	end;
end;

-- A function to get a player's diseases.
function Clockwork.disease:GetPlayerDiseases(player)
	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local diseaseInfo = player:GetCharacterData("diseaseInfo");

			if (diseaseInfo.diseases) then
				return diseaseInfo.diseases;
			end;
		end;
	end;
end;

-- A function to get a player's protection against infection.
function Clockwork.disease:GetInfectionProtection(player)
	if (player:IsValid() and player:HasInitialized()) then
		local infectionProtection = 0;
		local clothes = player:GetClothesItem();

		if (clothes) then
			if (clothes.infectionProtection) then
				infectionProtection = clothes.infectionProtection;
			end;
		end;

		return infectionProtection;
	end;
end;

-- A function to infect a player with a disease.
function Clockwork.disease:InfectPlayer(player, diseaseName, bLog)
	if !(self.stored[self:uniqueIDFormat(diseaseName)]) then return; end;
	local bLog = !bLog and true or false;

	if (player:IsValid() and player:HasInitialized() and player:Alive()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local characterDiseaseInfo = player:GetCharacterData("diseaseInfo");
			local uniqueID = self:uniqueIDFormat(diseaseName);
			local diseaseInfo = self:FindByID(uniqueID);
			local tableVer = self:GetTableVersion(diseaseInfo);
			local immune = self:IsPlayerImmune(player, diseaseName);

			if (immune) then return; end;

			characterDiseaseInfo.diseases[uniqueID] = tableVer;

			player:SetCharacterData("diseaseInfo", characterDiseaseInfo);
			Clockwork.plugin:Call("OnPlayerInfected", player, tableVer);

			if (bLog) then
				Clockwork.kernel:PrintLog(LOGTYPE_MINOR, player:Name().." has been infected with "..string.lower(diseaseName)..".");
			end;
		end;
	end;
end;

-- A function to cure a player of a disease.
function Clockwork.disease:CurePlayer(player, diseaseName, bLog)
	if !(self.stored[self:uniqueIDFormat(diseaseName)]) then return; end;
	local bLog = !bLog and true or false;

	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local characterDiseaseInfo = player:GetCharacterData("diseaseInfo");
			local uniqueID = self:uniqueIDFormat(diseaseName);

			if (characterDiseaseInfo.diseases[uniqueID]) then
				characterDiseaseInfo.diseases[uniqueID] = nil;

				player:SetCharacterData("diseaseInfo", characterDiseaseInfo);

				if (bLog) then
					Clockwork.kernel:PrintLog(LOGTYPE_MINOR, player:Name().." has been cured of "..string.lower(diseaseName)..".");
				end;
			end;
		end;
	end;
end;

-- A function to make a player completely healthy (cure the player of all diseases).
function Clockwork.disease:MakePlayerHealthy(player, bLog)
	local bLog = !bLog and true or false;

	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local diseaseInfo = player:GetCharacterData("diseaseInfo");

			if (diseaseInfo.diseases) then
				diseaseInfo.diseases = nil;

				player:SetCharacterData("diseaseInfo", diseaseInfo);
			end;

			if (bLog) then
				Clockwork.kernel:PrintLog(LOGTYPE_MINOR, player:Name().." has been cured of all diseases.");
			end;
		end;
	end;
end;

-- A function to make a player immune to a disease.
function Clockwork.disease:MakePlayerImmune(player, diseaseName, bLog)
	if !(self.stored[self:uniqueIDFormat(diseaseName)]) then return; end;
	local bLog = !bLog and true or bLog;

	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local diseaseInfo = player:GetCharacterData("diseaseInfo");
			local uniqueID = self:uniqueIDFormat(diseaseName);

			diseaseInfo.immunities[uniqueID] = true;

			player:SetCharacterData("diseaseInfo", diseaseInfo);

			if (bLog) then
				Clockwork.kernel:PrintLog(LOGTYPE_MINOR, player:Name().." has been made immune to "..string.lower(diseaseName)..".");
			end;
		end;
	end;
end;

-- A function to set a player's immunities.
function Clockwork.disease:SetPlayerImmunities(player, immunities)
	if !(immunities) then return; end;

	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local diseaseInfo = player:GetCharacterData("diseaseInfo");

			diseaseInfo.immunities = immunities;

			player:SetCharacterData("diseaseInfo", diseaseInfo);
		end;
	end;
end;

-- A function to get whether a player is immune to a disease or not.
function Clockwork.disease:IsPlayerImmune(player, diseaseName)
	if !(self.stored[self:uniqueIDFormat(diseaseName)]) then return; end;

	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local diseaseInfo = player:GetCharacterData("diseaseInfo");
			local uniqueID = self:uniqueIDFormat(diseaseName);
			local actualDiseaseInfo = self:FindByID(uniqueID);
			local faction = string.lower(player:GetFaction());

			if (diseaseInfo.immunities[uniqueID]) then
				return true;
			end;

			for k, v in pairs(actualDiseaseInfo.immuneFactions) do
				if (string.lower(v) == faction) then
					return true;
				end;
			end;
		end;
	end;

	return false;
end;

-- A function wipe all of a player's immunities.
function Clockwork.disease:WipePlayerImmunities(player)
	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local diseaseInfo = player:GetCharacterData("diseaseInfo");

			diseaseInfo.immunities = {};

			player:SetCharacterData("diseaseInfo", diseaseInfo);
		end;
	end;
end;

-- A function to execute a disease's init function.
function Clockwork.disease:DoDiseaseInit(player, diseaseName)
	if !(player) or !(diseaseName) then return; end;

	if (player:IsValid() and player:HasInitialized()) then
		local diseaseInfo = self:FindByID(diseaseName);
		local characterDiseaseInfo = player:GetCharacterData("diseaseInfo")
		local uniqueID = string.lower(string.gsub(diseaseName, "%s", "_"));

		diseaseInfo:OnInit(player);
	end;
end;

-- A function to execute a disease's unload function.
function Clockwork.disease:DoDiseaseUnload(player, diseaseName)
	if !(player) or !(diseaseName) then return; end;

	if (player:IsValid() and player:HasInitialized()) then
		local diseaseInfo = self:FindByID(diseaseName);
		local characterDiseaseInfo = player:GetCharacterData("diseaseInfo")
		local uniqueID = string.lower(string.gsub(diseaseName, "%s", "_"));

		diseaseInfo:OnUnload(player);
	end;
end;

-- A function to execute a disease's temporary effect.
function Clockwork.disease:TriggerTempEffect(player, diseaseName)
	if !(player) or !(diseaseName) then return; end;

	if (player:IsValid() and player:HasInitialized()) then
		local diseaseInfo = self:FindByID(diseaseName);
		local characterDiseaseInfo = player:GetCharacterData("diseaseInfo")
		local uniqueID = string.lower(string.gsub(diseaseName, "%s", "_"));

		diseaseInfo:OnTemporaryEffect(player);
		Clockwork.plugin:Call("OnPlayerExperienceDiseaseTempEffect", player, characterDiseaseInfo.diseases[uniqueID]);
	end;
end;

-- A function to execute a disease's persist effect.
function Clockwork.disease:DoPersistEffect(player, diseaseName)
	if !(player) or !(diseaseName) then return; end;

	if (player:IsValid() and player:HasInitialized()) then
		local diseaseInfo = self:FindByID(diseaseName);
		local characterDiseaseInfo = player:GetCharacterData("diseaseInfo")
		local uniqueID = string.lower(string.gsub(diseaseName, "%s", "_"));

		diseaseInfo:PersistEffect(player);
	end;
end;

-- A function to end a disease's incubation period.
function Clockwork.disease:EndIncubation(player, diseaseName)
	if !(player) or !(diseaseName) then return; end;

	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then		
			if (self:IsPlayerSickWith(player, diseaseName)) then
				local diseaseInfo = player:GetCharacterData("diseaseInfo");
				local diseases = diseaseInfo.diseases;

				if (diseases[diseaseName]) then
					diseases[diseaseName].incubating = false;
				end;

				player:SetCharacterData("diseaseInfo", diseaseInfo);
				diseases[diseaseName]:OnIncubationEnd(player);
				Clockwork.plugin:Call("OnDiseaseIncubationEnd", player, diseases[diseaseName]);
			end;
		end;
	end;
end;

-- A function to get a disease as a regular table.
function Clockwork.disease:GetTableVersion(diseaseInfo)
	if !(diseaseInfo) then return; end;
	local tableVer = {};

	for k, v in pairs(diseaseInfo) do
		tableVer[k] = v;
	end;

	return tableVer;
end;

-- A function to create a new vaccine based on a disease.
function Clockwork.disease:MakeVaccine(diseaseInfo)
	if !(diseaseInfo) then return; end;

	local ITEM = Clockwork.item:New();
	ITEM.name = diseaseInfo.name.." vaccine";
	ITEM.description = "A syringe containing the vaccine against "..string.lower(diseaseInfo.name)..".";
	ITEM.model = "models/props_c17/TrapPropeller_Lever.mdl";
	ITEM.business = false;
	ITEM.weight = 0.1;
	ITEM.category = "Medical";
	ITEM.useText = "Inject";

	function ITEM:OnUse(player, itemEntity)
		if (player.isInjecting) then
			Clockwork.player:Notify(player, "You are already injecting a vaccine into a character!");
		else
			local trace = player:GetEyeTraceNoCursor();
			if !(trace.Hit) then return; end;
			local entity = trace.Entity;
			local target = Clockwork.entity:GetPlayer(entity);

			if IsValid(target) then
				if (entity:GetShootPos():Distance( player:GetShootPos() ) <= 192) then
					local injectTime = Schema:GetDexterityTime(player);
					Clockwork.player:SetAction(player, "injecting", injectTime);

					Clockwork.player:EntityConditionTimer(player, target, entity, injectTime, 192, function()
						local trace2 = player:GetEyeTraceNoCursor();
						if (!trace2.Entity) then return true; end;
						if (player:Alive() and !player:IsRagdolled() and trace2.Entity == entity) then
							return true;
						end;
					end, function(success)
						if (success) then
							if !(Clockwork.disease:IsPlayerImmune(entity, diseaseInfo.name)) then
								Clockwork.disease:MakePlayerImmune(entity, diseaseInfo.name);
								Clockwork.disease:CurePlayer(entity, diseaseInfo.name);
							end;
							
							player:TakeItem(self);
							player:ProgressAttribute(ATB_DEXTERITY, 20, true);
						end;
						
						player.isInjecting = nil;
						Clockwork.player:SetAction(player, "injecting", false);
					end);
				else
					if !(Clockwork.disease:IsPlayerImmune(player, diseaseInfo.name)) then
						Clockwork.disease:MakePlayerImmune(player, diseaseInfo.name);
						Clockwork.disease:CurePlayer(player, diseaseInfo.name);
					end;
					player:TakeItem(self);
				end;
			else
				if !(Clockwork.disease:IsPlayerImmune(player, diseaseInfo.name)) then
					Clockwork.disease:MakePlayerImmune(player, diseaseInfo.name);
					Clockwork.disease:CurePlayer(player, diseaseInfo.name);
				end;
				player:TakeItem(self);
			end
		end;
		return false;
	end;

	ITEM:Register()
end;

-- A function to create a new pathogen syringe based on a disease.
function Clockwork.disease:MakePathogenSyringe(diseaseInfo)
	if !(diseaseInfo) then return; end;

	local ITEM = Clockwork.item:New();
	ITEM.name = diseaseInfo.name.." pathogen";
	ITEM.description = "A syringe containing the pathogen that causes "..string.lower(diseaseInfo.name)..".";
	ITEM.model = "models/props_c17/TrapPropeller_Lever.mdl";
	ITEM.business = false;
	ITEM.weight = 0.1;
	ITEM.category = "Medical";
	ITEM.useText = "Inject";

	function ITEM:OnUse(player, itemEntity)
		if (player.isInjecting) then
			Clockwork.player:Notify(player, "You are already injecting a pathogen into a character!");
		else
			local trace = player:GetEyeTraceNoCursor();
			if !(trace.Hit) then return; end;
			local entity = trace.Entity;
			local target = Clockwork.entity:GetPlayer(entity);

			if IsValid(target) then
				if (entity:GetShootPos():Distance( player:GetShootPos() ) <= 192) then
					local injectTime = Schema:GetDexterityTime(player);
					Clockwork.player:SetAction(player, "injecting", injectTime);

					Clockwork.player:EntityConditionTimer(player, target, entity, injectTime, 192, function()
						local trace2 = player:GetEyeTraceNoCursor();
						if (!trace2.Entity) then return true; end;
						if (player:Alive() and !player:IsRagdolled() and trace2.Entity == entity) then
							return true;
						end;
					end, function(success)
						if (success) then
							if !(Clockwork.disease:IsPlayerSickWith(entity, diseaseInfo.name)) then
								Clockwork.disease:InfectPlayer(entity, diseaseInfo.name);
							end;
							
							player:TakeItem(self);
							player:ProgressAttribute(ATB_DEXTERITY, 20, true);
						end;
						
						player.isInjecting = nil;
						Clockwork.player:SetAction(player, "injecting", false);
					end);
				else
					if !(Clockwork.disease:IsPlayerSickWith(player, diseaseInfo.name)) then
						Clockwork.disease:InfectPlayer(player, diseaseInfo.name);
					end;
					player:TakeItem(self);
				end;
			else
				if !(Clockwork.disease:IsPlayerSickWith(player, diseaseInfo.name)) then
					Clockwork.disease:InfectPlayer(player, diseaseInfo.name);
				end;
				player:TakeItem(self);
			end;
		end;
		return false;
	end;

	ITEM:Register()
end;

-- A function to register a new disease.
function Clockwork.disease:Register(data, name)
	local realName = string.gsub(name, "%s", "");
	local uniqueID = string.lower(realName);
	
	self.stored[uniqueID] = data;
	
	self:MakeVaccine(data);
	self:MakePathogenSyringe(data);
	
	return self.stored[uniqueID];
end;

-- A function to create a new disease.
function Clockwork.disease:New(name)
	local object = Clockwork.kernel:NewMetaTable(DISEASE);
		object.name = name;
		object.description = "A completely unknown disease.";
		object.transmissionType = "contact";
		object.incubationTime = 120;
		object.incubating = true; -- Don't override
		object.chronic = false;
		object.extraSickTime = 0;
		object.immuneFactions = {};
		object.severity = 0;
		object.lethality = 0;
		object.infectuous = true;
		object.OnIncubationEnd = function(object, player) end;
		object.PersistEffect = function(object, player) end;
		object.OnTemporaryEffect = function(object, player) end;
		object.OnInit = function(object, player) end;
		object.OnUnload = function(object, player) end;
	return object;
end;

-- A function to return a string in uniqueID format.
function Clockwork.disease:uniqueIDFormat(text)
	return string.lower(string.gsub(text, "%s", ""));
end

-- A function to find a disease by an identifier.
function Clockwork.disease:FindByID(identifier)
	return self.stored[string.lower(string.gsub(identifier, "%s", ""))];
end;

-- A function to get all diseases.
function Clockwork.disease:GetAll()
	return self.stored;
end;

-- A function to create a disease contact timer.
function Clockwork.disease:ContactTimer(player, entity, delay, distance, Condition, Callback)
	local realDelay = CurTime() + delay;
	local uniqueID = player:UniqueID();
	
	if (player.cwContactTimer) then
		player.cwContactTimer.Callback(false);
		player.cwContactTimer = nil;
	end;
	
	player.cwContactTimer = {
		delay = realDelay, entity = entity,
		distance = distance, Callback = Callback,
		Condition = Condition
	};
	
	Clockwork.kernel:CreateTimer("DiseaseContactTimer"..uniqueID, 0, 0, function()
		if (!IsValid(player)) then
			Clockwork.kernel:DestroyTimer("DiseaseContactTimer"..uniqueID);
			Callback(false);
			return;
		end;
		
		if (IsValid(entity) and Condition() and player:GetPos():Distance(entity:GetPos()) <= distance) then
			if (CurTime() >= realDelay) then
				Callback(true); player.cwContactTimer = nil;
				Clockwork.kernel:DestroyTimer("DiseaseContactTimer"..uniqueID);
			end;
		else
			Callback(false); player.cwContactTimer = nil;
			Clockwork.kernel:DestroyTimer("DiseaseContactTimer"..uniqueID);
		end;
	end);
end;