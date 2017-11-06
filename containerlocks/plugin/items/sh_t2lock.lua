local ITEM = Clockwork.item:New()
ITEM.name = "T2 Lock"
ITEM.cost = 60
ITEM.model = "models/props_wasteland/prison_padlock001a.mdl"
ITEM.weight = 1
ITEM.access = "1vV3"
ITEM.category = "Other"
ITEM.business = true
ITEM.spawnType = "misc";
ITEM.spawnValue = 4;
ITEM.description = "A large padlock, it appears to have a set of keys dangled onto it.\nThis item can be used to place a random password on a container.\nPassworded containers can be breached to have their password taken away."
local randomwords = {
"fort",
"adjunct",
"union",
"sword",
"jury", "shield",
"taco",
"plumbus",
"morty",
"dumbledore",
"snape",
"white",
"black",
"yellow",
"green",
"blue",
"dinglebop",
"1000yearsrickandmorty",
"lock",
"stabilize",
"cauterize",
"duty",
"sword",
"noon",
"dinner",
"parashock",
"parashockdinner",
"dinnershock",
"germans",
"denny",
"british",
"cube",
"sphere",
"rectangle",
"absolute",
"penfifteen",
"hairy",
"twelve",
"quantum",
"enterprise",
"star",
"trek",
"additional",
"mathematical",
"radical"}

-- Called when a player drops the item.
function ITEM:OnUse(player, position)
	local trace = player:GetEyeTraceNoCursor()
	local password = tostring(math.random(1, 99999))
	local word = table.Random(randomwords)

	if trace.Entity.cwPassword ~= nil then
		player:Notify("This container already has a lock around it, what did you think was going to happen?")

		return false
	end

	if (IsValid(trace.Entity)) then
		if (Clockwork.entity:IsPhysicsEntity(trace.Entity)) then
			local model = string.lower(trace.Entity:GetModel())

			if (cwStorage.containerList[model]) then
				if (not trace.Entity.inventory) then
					cwStorage.storage[trace.Entity] = trace.Entity
					trace.Entity.inventory = {}
				end

				trace.Entity.cwPassword = word .. password
				trace.Entity:SetNetworkedString("Name", "This container is locked with a " .. ITEM.name)
				Clockwork.player:Notify(player, "This container's password has been set to '" .. word .. password .. "'.")
			else
				Clockwork.player:Notify(player, "This is not a valid container!")
				return false
			end
		else
			Clockwork.player:Notify(player, "This is not a valid container!")
			return false
		end
	else
		Clockwork.player:Notify(player, "This is not a valid container!")
		return false
	end
end

function ITEM:OnDrop()
	end

ITEM:Register()