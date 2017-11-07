local PERK = Atomic.perks:New();

PERK.name = "Black Widow";
PERK.icon = "atomic/hud/perks/black_widow.png";
PERK.description = "In combat, you do +10% damage against male opponents. Outside of combat, you'll sometimes have access to unique dialogue options when dealing with the opposite sex.";

if (SERVER) then
	function PERK.module:PlayerTakeDamage(player, inflictor, attacker, hitGroup, damageInfo)
		if (player:GetGender() == GENDER_MALE) then
			if (attacker:IsPlayer() and attacker != player and attacker:HasPerk(PERK.name)) then
				player.damageCalc = player.damageCalc or 0;
				player.damageCalc = player.damageCalc + 1;

				if (player.damageCalc >= 2) then
					local dmg = damageInfo:GetDamage();
					
					damageInfo:SetDamage(math.Round(dmg * 1.10), 2);

					player.damageCalc = nil;
				end;
			end;
		end;
	end;
end;

PERK:Register();