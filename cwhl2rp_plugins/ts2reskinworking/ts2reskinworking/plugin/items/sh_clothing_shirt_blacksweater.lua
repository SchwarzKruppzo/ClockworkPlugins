local ITEM = Clockwork.item:New();
ITEM.name = "Black Sweater";
ITEM.model = "models/tnb/items/aphelion/shirt_citizen1.mdl";
ITEM.skin = 3;
ITEM.weight = 0.5;
ITEM.useText = "Wear Sweater";
ITEM.category = "Clothing";
ITEM.description = "An old pre-war sweater that contains a few spare pockets.";
ITEM.customFunctions = {"Remove"};
ITEM.access = "1";
ITEM.business = true;  
ITEM.addInvSpace = 4.5;
 
local bodyGroup = 1;
 
 if (CLIENT) then
	function ITEM:GetClientSideInfo()
		if (!self:IsInstance()) then return; end;
		
		if (Clockwork.player:IsWearingItem(self)) then
			return "Is Wearing: Yes";
		else
			return "Is Wearing: No";
		end;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position)
 
 
                        local target = player
                        local targetBodyGroups = target:GetCharacterData("BodyGroups") or {};
                        local bodyGroupState = 0;
                        local model = target:GetModel();
               
                        if( bodyGroup < target:GetNumBodyGroups() )then
                                targetBodyGroups[model] = targetBodyGroups[model] or {};
                       
                                if( bodyGroupState == 0 )then
                                        targetBodyGroups[model][tostring(bodyGroup)] = nil;
                                else
                                        targetBodyGroups[model][tostring(bodyGroup)] = bodyGroupState;
                                end;
                       
                                target:SetBodygroup(bodyGroup, bodyGroupState);
                       
                                target:SetCharacterData("BodyGroups", targetBodyGroups);
                               
                        end;
return true
               
end;
 
 
-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
        if (player:Alive() and !player:IsRagdolled()) then
                if (!self.CanPlayerWear or self:CanPlayerWear(player, itemEntity) != false) then
               
                local target = player
                local targetBodyGroups = target:GetCharacterData("BodyGroups") or {};
                local bodyGroupState = 6;
 
                local model = target:GetModel();
               
                if( bodyGroup < target:GetNumBodyGroups() )then
                        targetBodyGroups[model] = targetBodyGroups[model] or {};
                       
                        if( bodyGroupState == 0 )then
                                targetBodyGroups[model][tostring(bodyGroup)] = nil;
                        else
                                targetBodyGroups[model][tostring(bodyGroup)] = bodyGroupState;
                        end;
                       
                        target:SetBodygroup(bodyGroup, bodyGroupState);
                       
                        target:SetCharacterData("BodyGroups", targetBodyGroups);
               
                        return true;
 
                        end;
                end;
        end;
end;
 
if (SERVER) then
        function ITEM:OnCustomFunction(player, name)
                if (name == "Remove") then
               
                        local target = player
                        local targetBodyGroups = target:GetCharacterData("BodyGroups") or {};
                        local bodyGroupState = 0;
                        local model = target:GetModel();
               
                        if( bodyGroup < target:GetNumBodyGroups() )then
                                targetBodyGroups[model] = targetBodyGroups[model] or {};
                       
                                if( bodyGroupState == 0 )then
                                        targetBodyGroups[model][tostring(bodyGroup)] = nil;
                                else
                                        targetBodyGroups[model][tostring(bodyGroup)] = bodyGroupState;
                                end;
                       
                                target:SetBodygroup(bodyGroup, bodyGroupState);
                       
                                target:SetCharacterData("BodyGroups", targetBodyGroups);
                               
                        end;
                                               
end;
end;
end;
 
ITEM:Register();