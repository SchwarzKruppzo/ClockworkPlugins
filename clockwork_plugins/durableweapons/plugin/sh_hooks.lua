--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode
--]]
--]]

local function GetClientSideInfo(itemTable)
	local durability = itemTable:GetData("Durability");
	local clientSideInfo = "";
	local durabilityColor = Color((255 / 100) * (100 - durability), (255 / 100) * durability, 0, 255);
	
	clientSideInfo = Clockwork.kernel:AddMarkupLine(
		clientSideInfo, "Durability: "..math.floor(durability).."%", durabilityColor
	);
	
	return (clientSideInfo != "" and clientSideInfo);
end;

-- Called when a Clockwork item has initialized.
function cwDurableWeapons:ClockworkItemInitialized(itemTable)
	if (Clockwork.item:IsWeapon(itemTable)) then
		if (itemTable.GetClientSideInfo) then
			itemTable.OldGetClientSideInfo = itemTable.GetClientSideInfo;
			itemTable.NewGetClientSideInfo = GetClientSideInfo;
			itemTable.GetClientSideInfo = function(itemTable)
				local existingText = itemTable:OldGetClientSideInfo();
				local additionText = itemTable:NewGetClientSideInfo() or "";
				local totalText = (existingText and existingText.."\n" or "")..additionText;
				
				return (totalText != "" and totalText);
			end;
		else
			itemTable.GetClientSideInfo = GetClientSideInfo;
		end;
		
		itemTable:AddData("Durability", 100, true);
	end;
end;