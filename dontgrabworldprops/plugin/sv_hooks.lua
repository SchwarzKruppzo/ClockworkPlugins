function PLUGIN:InitPostEntity()
	for k, v in pairs (ents.GetAll()) do
		WorldProps[#WorldProps + 1] = v;
	end;
end;

function PLUGIN:PhysgunPickup(player, ent)
	if (WorldProps) then
		for k, v in pairs(WorldProps) do
			if (ent == v) then
				return false;
			end;
		end;
	end;
end;