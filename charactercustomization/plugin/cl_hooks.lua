local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when the character panel weapon model is needed.
function PLUGIN:GetCharacterPanelSequence(entity, character) 
	for k, v in pairs(Clockwork.kernel:Deserialize(character.customizationOptions or "")) do
		if (k == "Skin") then
			entity:SetSkin(v);
		else
			entity:SetBodygroup(k, v);
		end;
	end;
end;

-- Called when the menu's items should be adjusted.
function PLUGIN:MenuItemsAdd(menuItems)
	local bodygroups = Clockwork.Client:GetBodyGroups();
	local bodygroupCount = table.Count(bodygroups) - 1;
	local skinCount = Clockwork.Client:SkinCount() - 1;

	if (bodygroupCount > 0 or skinCount > 0) then
		menuItems:Add("Customizer", "cwCharacterCustomizer", "Customize your character's appearance.");
	end;
end;

Clockwork.datastream:Hook("CustomizationOptions", function(data)
	Clockwork.Client.customizationOptions = data;
end);