local PLUGIN = PLUGIN;
	
-- A function to load the ration machines.
function PLUGIN:LoadNuttyVendingMachines()
	local nutVend = Clockwork.kernel:RestoreSchemaData("plugins/nutVend/"..game.GetMap());
	
	for k, v in pairs(nutVend) do
		local entity = ents.Create("nut_vend");
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

-- A function to save the ration machines.
function PLUGIN:SaveNuttyVendingMachines()
	local nutVend = {};
	
	for k, v in pairs(ents.FindByClass("nut_vend")) do
		nutVend[#nutVend + 1] = {
			pos = v:GetPos(),
			angles = v:GetAngles(),
			active = v:GetDTBool(0),
			stock1 = v:GetDTFloat(1);
			stock2 = v:GetDTFloat(2);
			stock3 = v:GetDTFloat(3);
			stock4 = v:GetDTFloat(4);
		}
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/nutVend/"..game.GetMap(), nutVend);
end;