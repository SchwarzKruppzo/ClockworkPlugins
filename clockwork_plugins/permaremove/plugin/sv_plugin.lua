local PLUGIN = PLUGIN;

-- A function to load the door data.
function PLUGIN:LoadRemoves()
	self.removeData = {};
	
	local positions = {};
	local removeData = Clockwork.kernel:RestoreSchemaData("plugins/removeData/"..game.GetMap());
	--[[
	for k, v in pairs(ents.GetAll()) do
		if (IsValid(v)) then
			local position = v:GetPos();
			
			if (position) then
				positions[tostring(position)] = v;
			end;
		end;
	end;
	--]]
	for k1, v1 in pairs(ents.GetAll()) do
		for k, v in pairs(removeData) do
			if v1:GetPos() == v.position and v1:GetClass() == v.class then
				v1:Remove();
			end;
			--[[
			local entity = positions[tostring(v.position)];
			
			if (IsValid(entity) and !self.removeData[entity]) then
				local data = {
					class = v.class,
					position = v.position,
					entity = entity,
					angle = v.angle,
					name = v.name
				};
					
				self.removeData[data.entity] = data;
			end;
			--]]
		end;
	end;
end;

-- A function to save the door data.
function PLUGIN:SaveRemoves()
	local removeData = {};
	
	for k, v in pairs(self.removeData) do
		local data = {
			class = v.class,
			position = v.position
		};
		
		removeData[#removeData + 1] = data;
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/removeData/"..game.GetMap(), removeData);
end;