local ITEM = Clockwork.item:New()
ITEM.name = "Radio Jammer"
ITEM.model = "models/gibs/manhack_gib02.mdl"
ITEM.useText = "Turn on"
ITEM.weight = 0.4
ITEM.cost = 750
ITEM.business = true
ITEM.access = "V"
ITEM.category = "Communication"
ITEM.description = "A device that can distort outgoing radio messages."
ITEM.active = false
ITEM.isdropped = false

ITEM:AddData("active", false, true)
ITEM:AddQueryProxy("active", "active")
ITEM:AddData("useText", "Turn on", true)
ITEM:AddQueryProxy("useText", "useText")
ITEM:AddData("isdropped", false, true)
ITEM:AddQueryProxy("isdropped", "isdropped")

function ITEM:OnUse(player, itemEntity)
	-- We don't want crafty players getting any ideas, we won't let them use the jammer if it's been marked as dropped.
	if !self:GetData("isdropped") then
		-- If the jammer is already on, turn it off, and if it's off, turn it on.
		if self:GetData("active") then
			player:EmitSound("buttons/button19.wav")
			-- We make the players close by unaffected by the jammer.
			for k,v in pairs(_player.GetAll()) do
				if v:GetPos():Distance(player:GetPos()) <= Clockwork.config:Get("jammer_range"):Get() then
					v:SetSharedVar("affectedbyjam", false)
				end
			end
			-- Set our data so that the use text will be turn on after we turn the jammer on, and mark the jammer as inactive.
			self:SetData("useText", "Turn on")
			self:SetData("active", false)
		else
			player:EmitSound("buttons/button18.wav")
			-- Have the player emit low volume zap sounds each third second so long as the jammer is on.
			self:SetData("useText", "Turn off")
			self:SetData("active", true)
		end
	else
		Clockwork.player:Notify(player, "You can only operate this from your invetory!")
	end
	-- This isn't a consumable, so we should return false.
	return false
end

-- We want the jammer to be turned off when dropped. The code here is pretty much the same as above for turning off the jammer.
function ITEM:OnDrop(player, position)
	-- Mark the jammer as dropped.
	self:SetData("isdropped", true)
	if self:GetData("active") then
		player:EmitSound("buttons/button19.wav")
		for k,v in pairs(_player.GetAll()) do
			if v:GetPos():Distance(player:GetPos()) <= Clockwork.config:Get("jammer_range"):Get() then
				v:SetSharedVar("affectedbyjam", false)
			end
		end
		player:SetSharedVar("affectedbyjam", false)
		self:SetData("useText", "Turn on")
		self:SetData("active", false)
	end
end

-- When picked up, the jammer shouldn't be marked as dropped anymore.
function ITEM:OnPickup()
	self:SetData("isdropped", false)
end

ITEM:Register()