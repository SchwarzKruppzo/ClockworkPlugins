--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode
--]]

function cwShootToMiss:EntityFireBullets(entity, bulletInfo)
	if (entity:IsPlayer()) then
		entity = entity:GetActiveWeapon();
	end;
	
	if (entity and entity:IsWeapon()) then
		if (math.random() >= Clockwork.config:Get("s2m_chance"):Get()) then
			bulletInfo.Damage = 0;
			bulletInfo.Spread = bulletInfo.Spread + Vector(math.Rand(-16, 16), math.Rand(-16, 16), 0);
		end;
	end;
end;