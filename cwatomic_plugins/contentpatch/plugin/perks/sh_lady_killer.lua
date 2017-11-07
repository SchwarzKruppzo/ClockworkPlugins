local PERK = Atomic.perks:New();

PERK.name = "Lady Killer";
PERK.icon = "atomic/hud/perks/lady_killer.png";
PERK.description = "In combat, you do +10% damage against female opponents. Outside of combat, you'll sometimes have access to unique dialogue options when dealing with the opposite sex.";

if (SERVER) then
	function PERK.module:PlayerTakeDamage(player, inflictor, attacker, hitGroup, damageInfo)
		if (player:GetGender() == GENDER_FEMALE) then
			if (attacker:IsPlayer() and attacker != player and attacker:HasPerk(PERK.name)) then
				player.damageCalc = player.damageCalc or 0;
				player.damageCalc = player.damageCalc + 1;

				if (player.damageCalc >= 3) then
					local dmg = damageInfo:GetDamage();

					damageInfo:SetDamage(math.Round(dmg * 1.10), 2);

					player.damageCalc = nil;
				end;
			end;
		end;
	end;
end;

PERK:Register();