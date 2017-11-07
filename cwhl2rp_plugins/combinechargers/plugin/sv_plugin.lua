local PLUGIN = PLUGIN;
	
-- A function to load the chargers
function PLUGIN:LoadSUVendor()
	local SUVendor= Clockwork.kernel:RestoreSchemaData("plugins/SUVendor/"..game.GetMap());
	
	for k, v in pairs(SUVendor) do
		local entity = ents.Create("cw_suvendor");
		entity:SetPos(v.pos);
		entity:SetAngles(v.angles);
		entity:Spawn();
		entity:Activate();
		entity:SetDTBool(0, v.active);
		--entity:SetSharedVar("stocks", v.stocks);
		entity:SetDTFloat(1, v.stock1);
		entity:SetDTFloat(2, v.stock2);
		entity:SetDTFloat(3, v.stock3);
		entity:SetDTFloat(4, v.stock4)
	end;
end;
function PLUGIN:LoadHEVendor()
	local HEVendor= Clockwork.kernel:RestoreSchemaData("plugins/HEVendor/"..game.GetMap());
	
	for k, v in pairs(HEVendor) do
		local entity = ents.Create("cw_HEVendor");
		entity:SetPos(v.pos);
		entity:SetAngles(v.angles);
		entity:Spawn();
		entity:Activate();
		entity:SetDTBool(0, v.active);
		--entity:SetSharedVar("stocks", v.stocks);
		entity:SetDTFloat(1, v.stock1);
		entity:SetDTFloat(2, v.stock2);
		entity:SetDTFloat(3, v.stock3);
		entity:SetDTFloat(4, v.stock4)
	end;
end;

-- A function to save the chargers
function PLUGIN:SaveSUVendor()
	local SUVendor = {};
	
	for k, v in pairs(ents.FindByClass("cw_suvendor")) do
		SUVendor[#SUVendor + 1] = {
			pos = v:GetPos(),
			angles = v:GetAngles(),
			active = v:GetDTBool(0),
			stock1 = v:GetDTFloat(1);
			stock2 = v:GetDTFloat(2);
			stock3 = v:GetDTFloat(3);
			stock4 = v:GetDTFloat(4);
		}
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/SUVendor/"..game.GetMap(), SUVendor);
end;
function PLUGIN:SaveHEVendor()
	local HEVendor = {};
	
	for k, v in pairs(ents.FindByClass("cw_hevendor")) do
		HEVendor[#HEVendor + 1] = {
			pos = v:GetPos(),
			angles = v:GetAngles(),
			active = v:GetDTBool(0),
			stock1 = v:GetDTFloat(1);
			stock2 = v:GetDTFloat(2);
			stock3 = v:GetDTFloat(3);
			stock4 = v:GetDTFloat(4);
		}
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/HEVendor/"..game.GetMap(), HEVendor);
end;