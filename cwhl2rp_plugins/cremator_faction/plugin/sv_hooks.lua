local PLUGIN = PLUGIN;
local Clockwork = Clockwork;


-- Called when a player's weapons should be given.
function PLUGIN:PlayerGiveWeapons(player)
	if (player:GetFaction() == FACTION_CREMATOR) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_immolator");
		Clockwork.player:GiveSpawnWeapon(player, "cw_beam_immolator");
	end;
end;

-- Called at an interval while a player is connected.
function PLUGIN:PlayerThink(player, curTime, infoTable)
	local CrematorSound = "npc/cremator/amb_loop.wav"
	local sound = CreateSound(player, "npc/cremator/amb_loop.wav");
	local faction = player:GetFaction();

	if (player:Alive() and !player:IsRagdolled()) then
			if ( faction == FACTION_CREMATOR ) then
		-- player:EmitSound(CrematorSound, 65, 50);
		sound:Play();
	else
		-- BroadcastLua("LocalPlayer():ConCommand('stopsound')") Doesn't fukin work
		sound:Stop();
			end;
		end;
end;

-- Called when a player's typing display has started.
function PLUGIN:PlayerStartTypingDisplay(player, code)
	local faction = player:GetFaction();
	if ( faction == FACTION_CREMATOR ) then
		if (code == "n" or code == "y" or code == "w" or code == "r") then
			if (!player.typingBeep) then
				player.typingBeep = true;
				
				player:EmitSound("npc/overwatch/radiovoice/on3.wav");
			end;
		end;
	end;
end;

-- Called when a player's typing display has finished.
function PLUGIN:PlayerFinishTypingDisplay(player, textTyped)
	local faction = player:GetFaction();
	if ( faction == FACTION_CREMATOR and textTyped ) then
		if (player.typingBeep) then
			player:EmitSound("npc/overwatch/radiovoice/off4.wav");
		end;
	end;
	
	player.typingBeep = nil;
end;

-- Called when a player's character has initialized.
function PLUGIN:PlayerCharacterInitialized(player)
	local faction = player:GetFaction();
	
	if (faction == FACTION_CREMATOR) then
		Schema:AddCombineDisplayLine( "Rebuilding active Cremator Unit Manifest..", Color(255, 165, 0, 255) );
	end;
end;

-- Called when a player's death sound should be played.
function PLUGIN:PlayerPlayDeathSound(player, gender)
	local faction = player:GetFaction();
		
		
	if ( faction == FACTION_CREMATOR ) then
		local crmsound = "npc/cremator/crem_die.wav";
		for k, v in ipairs( _player.GetAll() ) do
			if (v:HasInitialized()) then
				 if	( faction == FACTION_CREMATOR or faction == FACTION_MPF or faction == FACTION_OTA ) then
						v:EmitSound(crmsound);
						Schema:AddCombineDisplayLine( "BioSignal lost for Cremator Unit at unknown location..", Color(255, 0, 0, 255) );
				end;
			end;
		end;
		end;
		
		return crmsound;
end;


--[[ Called when a player's default inventory is needed. - Broken! There is a Hook for it!
function Schema:GetPlayerDefaultInventory(player, character, inventory)
	if (character.faction == FACTION_ADMIN) then
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("handheld_radio")
		);
	elseif (character.faction == FACTION_MPF) then
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("handheld_radio")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("weapon_pistol")
		);
		for i = 1, 2 do
			Clockwork.inventory:AddInstance(
				inventory, Clockwork.item:CreateInstance("ammo_pistol")
			);
		end;
	elseif (character.faction == FACTION_OTA) then
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("handheld_radio")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("weapon_pistol")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("ammo_pistol")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("weapon_ar2")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("ammo_ar2")
		);
	elseif (character.faction == FACTION_CREMATOR) then
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("handheld_radio")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("weapon_immolator")
		);
	else
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("suitcase")
		);
	end;
end;
--]]

-- Called when a player's default inventory is needed.
function PLUGIN:GetPlayerDefaultInventory(player, character, inventory)
	if (character.faction == FACTION_CREMATOR) then
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("handheld_radio")
		);
	end;
end;
		
-- Called when a player's footstep sound should be played.
function PLUGIN:PlayerFootstep(player, position, foot, sound, volume, recipientFilter)
	local clothes = player:GetCharacterData("clothes");
	local model = string.lower( player:GetModel() );
	local faction = player:GetFaction();
	
	-- if (PLUGIN:PlayerIsCremator(faction)) then
-- 	if ( faction == FACTION_CREMATOR )
	if (string.find(model, "cremator")) then
			if (foot == 0) then
				local randomSounds = {1, 2, 3};
				local randomNumber = math.random(1, 3);
				
				sound = "npc/cremator/foot"..randomSounds[randomNumber]..".wav";
			end;
		end;
	
	player:EmitSound(sound);
	
end;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	local clothes = player:GetCharacterData("clothes");
	local faction = player:GetFaction();
	
		if (!lightSpawn) then
		player:SetSharedVar("antidepressants", 0);
		
		Clockwork.datastream:Start(player, "ClearEffects", true);
		
		player.beingSearched = nil;
		player.searching = nil;

		end;

		if (player:GetFaction() == FACTION_CREMATOR) then
			player:SetMaxHealth(150);
			player:SetMaxArmor(100);
			player:SetHealth(150);
			player:SetArmor(100);
	end;



end;

--[[ Called when a player's pain sound should be played. - It does Loop sounds...
function PLUGIN:PlayerPlayPainSound(player, gender, damageInfo, hitGroup)
	local faction = player:GetFaction();
	if ( faction == FACTION_CREMATOR ) then
		return "npc/cremator/amb_mad.wav";
	end;
end;
--]]

--A Function to check if the player can open a Combine Door.
function PLUGIN:PlayerCanUseDoor(player, door)
    if player:GetFaction() == FACTION_CREMATOR then
        return true;
    end;
end;

-- Called when a player's pain sound should be played.
function PLUGIN:PlayerPlayPainSound(player, gender, damageInfo, hitGroup)
	local faction = player:GetFaction();
	if ( faction == FACTION_CREMATOR ) then
		return "npc/combine_soldier/pain"..math.random(1, 3)..".wav";
	end;
end;