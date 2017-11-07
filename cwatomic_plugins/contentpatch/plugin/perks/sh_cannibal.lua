local PERK = Atomic.perks:New();

PERK.name = "Cannibal";
PERK.karma = KARMA_EVIL;
PERK.icon = "atomic/hud/perks/cannibal.png";
PERK.description = "You've gained a taste for human flesh, allowing you to mutilate and consume dead bodies."

if (CLIENT) then
	-- Called when an entity's menu options are needed.
	function PERK.module:GetEntityMenuOptions(entity, options)
		if (Clockwork.Client:HasPerk(PERK.name) and Clockwork.Client:Health() > 0 and entity:GetClass() == "prop_ragdoll") then
			local player = Clockwork.entity:GetPlayer(entity);
			
			if (!player or !player:Alive()) then
				options["Mutilate"] = "cw_corpseMutilate";
			end;
		end;
	end;
else
	-- Called when an entity's menu option should be handled.
	function PERK.module:EntityHandleMenuOption(player, entity, option, arguments)
		if (player:HasPerk(PERK.name) and player:Health() > 0 and entity:GetClass() == "prop_ragdoll") then
			if (arguments == "cw_corpseMutilate") then
				local entityPlayer = Clockwork.entity:GetPlayer(entity);
				local trace = player:GetEyeTraceNoCursor();
				
				if (!entityPlayer or !entityPlayer:Alive()) then
					if (!entity.mutilated or entity.mutilated < 3) then
						entity.mutilated = (entity.mutilated or 0) + 1;
							local instance = Clockwork.item:CreateInstance("human_meat");

							player:GiveItem(instance, true);
							player:EmitSound("npc/barnacle/barnacle_crunch"..math.random(2, 3)..".wav");
						Clockwork.kernel:CreateBloodEffects(entity:NearestPoint(trace.HitPos), 1, entity);
					end;
				end;
			end;
		end;
	end;
end;

PERK:Register();