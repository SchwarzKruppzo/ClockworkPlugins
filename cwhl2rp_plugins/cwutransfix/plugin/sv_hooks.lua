local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	local cwuFaction = Clockwork.faction.stored["Civil Workers' Union"];

	if (cwuFaction) then
		function cwuFaction:OnTransferred(player, faction, name)
			local itemTable = Clockwork.item:FindByID("Union Card");

			if (itemTable) then
				local itemTable = Clockwork.item:CreateInstance(itemTable("uniqueID"));
				local bSuccess, fault = player:GiveItem(itemTable, true);
			end
		end;
	end;
end;