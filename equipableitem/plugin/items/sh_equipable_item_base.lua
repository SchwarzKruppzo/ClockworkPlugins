local ITEM = Clockwork.item:New(nil, true);
ITEM.name = "Equipable Item Base";
ITEM.uniqueID = "equipable_item_base";
ITEM.model = "models/gibs/hgibs.mdl";
ITEM.weight = 0.5;
ITEM.useText = "Equip";
ITEM.description = "A base for equipable items.";

ITEM:AddData("equipped", false, true);

-- Called when a player wears the accessory.
function ITEM:OnWearItem(player, bIsWearing)
	if (bIsWearing) then
	else
	end;
end;

function ITEM:HasPlayerEquipped(player, bIsValidWeapon)
	return self:GetData("equipped", false);
end;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if (player:Alive() and !player:IsRagdolled()) then
		if (self:GetData("equipped") != true) then
			if (!self.CanPlayerWear or self:CanPlayerWear(player, itemEntity) != false) then
				self:SetData("equipped", true);
				self:OnWearItem(player, true);
				player:RebuildInventory();
				return true;
			end;
		else
			Clockwork.player:Notify(player, "You are already wearing this item!");
		end;
	else
		Clockwork.player:Notify(player, "You cannot do this action at the moment!");
	end;
	
	return false;
end;

function ITEM:OnPlayerUnequipped(player, extraData)
	self:SetData("equipped", false);
	self:OnWearItem(player, false);
	player:RebuildInventory();
end;

function ITEM:OnStorageTake(player, storageTable)
	if (self:GetData("equipped") == true) then
		self:SetData("equipped", false);
		self:OnWearItem(player, false);
	end;
end;

function ITEM:OnStorageGive(player, storageTable)
	if (self:GetData("equipped") == true) then
		self:SetData("equipped", false);
		self:OnWearItem(player, false);
	end;
end;

function ITEM:OnDrop(player, position)
	if (self:GetData("equipped") == true) then
		self:SetData("equipped", false);
		self:OnWearItem(player, false);
	end;
end;

Clockwork.item:Register(ITEM);