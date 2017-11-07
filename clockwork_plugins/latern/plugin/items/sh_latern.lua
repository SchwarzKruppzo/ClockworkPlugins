local ITEM = Clockwork.item:New();
ITEM.name = "Latern";
ITEM.cost = 70;
ITEM.model = "models/items/combine_rifle_ammo01.mdl";
ITEM.weight = 2;
ITEM.classes = {CLASS_EMP, CLASS_EOW};
ITEM.category = "Lights"
ITEM.useText = "Place";
ITEM.business = true;
ITEM.description = "A Latern created in a combine orb ammo. It uses the energy from the orb to illuminate the area.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local trace = player:GetEyeTraceNoCursor();
	local entity = ents.Create("cw_latern");
	
	if (trace.HitPos:Distance( player:GetShootPos() ) <= 192) then
		
		Clockwork.player:GiveProperty(player, entity);
		
		entity:SetModel(self.model);
		entity:SetPos(trace.HitPos);
		entity:Spawn();
		
		if ( IsValid(itemEntity) ) then
			local physicsObject = itemEntity:GetPhysicsObject();
			
			entity:SetPos( itemEntity:GetPos() );
			entity:SetAngles( itemEntity:GetAngles() );
			
			if ( IsValid(physicsObject) ) then
				if ( !physicsObject:IsMoveable() ) then
					physicsObject = entity:GetPhysicsObject();
					
					if ( IsValid(physicsObject) ) then
						physicsObject:EnableMotion(false);
					end;
				end;
			end;
		else
			Clockwork.entity:MakeFlushToGround(entity, trace.HitPos, trace.HitNormal);
		end;
	else
		Clockwork.player:Notify(player, "You cannot drop a light that far away!");
		
		return false;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;
ITEM:Register();