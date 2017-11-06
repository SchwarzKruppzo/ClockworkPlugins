--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode
--]]

function cwDurableWeapons:EntityFireBullets(entity, bulletInfo)
	if (entity:IsPlayer()) then
		entity = entity:GetActiveWeapon();
	end;
	
	if (entity and entity:IsWeapon()) then
		local itemTable = Clockwork.item:GetByWeapon(entity);
		
		if (itemTable) then
			local originalDamage = bulletInfo.Damage;
			local durability = itemTable:GetData("Durability");
			local drainScale = 100 * Clockwork.config:Get("durability_decrease_scale"):Get();
			
			if (durability) then
				bulletInfo.Damage = (originalDamage / 100) * durability;
				bulletInfo.Spread = bulletInfo.Spread * (1 + (1 - ((1 / 100) * durability)));
				
				itemTable:SetData("Durability", math.max(durability - (originalDamage / drainScale), 0));
			end;
		end;
	end;
end;