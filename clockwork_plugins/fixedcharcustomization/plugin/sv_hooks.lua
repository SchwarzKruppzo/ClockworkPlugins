local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when a player's character creation info should be adjusted.
function PLUGIN:PlayerAdjustCharacterCreationInfo(player, info, data) 
	info.data["CustomizationOptions"] = Clockwork.kernel:Serialize(data.customizationOptions);
end;

-- Called when a player's character screen info should be adjusted.
function PLUGIN:PlayerAdjustCharacterScreenInfo(player, character, info)
	info.customizationOptions = character.data["CustomizationOptions" or ""];
end;

-- Called when a player has been ragdolled.
function PLUGIN:PlayerRagdolled(player, state, ragdoll)
	for k, v in pairs(player.customizationOptions) do
		if (k != "Skin") then
			ragdoll.entity:SetBodygroup(k, v); 
		end;
	end;
end;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	local customizationOptions = Clockwork.kernel:Deserialize(player:GetCharacterData("CustomizationOptions") or "");
	
	for k, v in pairs(customizationOptions) do
		if (k == "Skin") then
			timer.Simple(.1, function()
				if (IsValid(player)) then
					player:ClockworkSetSkin(v);
				end;
			end);
		else
			player:SetBodygroup(k, v);
		end;
	end;

	player.customizationOptions = customizationOptions;
	Clockwork.datastream:Start(player, "CustomizationOptions", customizationOptions);
end;

Clockwork.datastream:Hook("CustomizationOptions", function(player, data)
	for k, v in pairs(data) do
		if (k == "Skin") then
			player:ClockworkSetSkin(v);
		elseif (tonumber(k) and tonumber(v)) then
			player:SetBodygroup(k, v);
		end;
	end;

	player.customizationOptions = data;
	player:SetCharacterData("CustomizationOptions", Clockwork.kernel:Serialize(data));
end);