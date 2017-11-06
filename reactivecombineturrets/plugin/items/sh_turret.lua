--[[
Made by Jesus. o/
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Turret";
ITEM.cost = 30000;
ITEM.batch = 1;
ITEM.model = "models/Combine_turrets/Floor_turret.mdl";
ITEM.weight = 6.5;
ITEM.access = "VI";
ITEM.useText = "Deploy";
ITEM.color = Color(0, 25, 255, 255);
ITEM.classes = {CLASS_EMP, CLASS_EOW};
ITEM.category = "Others";
ITEM.business = true;
ITEM.description = "A large device, it folds up about the size of a suitcase for storage.";

-- Turrets system.
function ITEM:OnUse(player, itemEntity)
        local trace = player:GetEyeTraceNoCursor();

        if (trace.HitPos:Distance(player:GetShootPos()) <= 192) then
                local entity = ents.Create("npc_turret_floor")

                Clockwork.player:GiveProperty(player, entity);
                entity:SetModel(self.model);
                entity:SetPos(trace.HitPos);
                for k, v in ipairs(_player.GetAll()) do 
                        if (Schema:PlayerIsCombine(v)) then
                                entity:AddEntityRelationship(v, 3, 99)
                        else
                                entity:AddEntityRelationship(v, 1, 99)
                        end;
                end;
                player:TakeItem(self);
                entity:Spawn();
                timer.Simple(120, function() entity:Fire("Self Destruct", "", 0) end);

                if (IsValid(itemEntity) ) then
                        local physicsObject = itemEntity:GetPhysicsObject();
                        entity:SetPos(itemEntity:GetPos());
                        entity:SetAngles(itemEntity:GetAngles());

                        if (IsValid(physicsObject)) then
                            if (!physicsObject:IsMoveable()) then
                                    physicsObject = entity:GetPhysicsObject();

                                    if (IsValid(physicsObject)) then
                                        physicsObject:EnableMotion(false);
                                    end;
                            end;
                        end;
                else

                        Clockwork.entity:MakeFlushToGround(entity, trace.HitPos, trace.HitNormal);
                        player:TakeItem(self);
                        Clockwork.schema:AddCombineDisplayLine("Getting Turret Data...", Color(255, 100, 255, 255) );
                end;
        else
                Clockwork.player:Notify(player, "You can't drop a turret that far away!")

                return false;
        end;
end;




-- When the ITEM is dropped.
function ITEM:OnDrop(player, position) end;

ITEM:Register();





