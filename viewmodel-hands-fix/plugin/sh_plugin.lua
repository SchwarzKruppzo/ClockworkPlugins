local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

if (SERVER) then
	--! CAX 5

	-- Called when a player has spawned.
	 function PLUGIN:PlayerSpawn(player)
	 player:SetupHands();
	 end;
	 -- Called when a player's character has initialized.
	 function PLUGIN:PlayerCharacterInitialized(player)
	 timer.Simple(1, function()
	 local hands = player:GetHands();
	 if (IsValid(hands)) then
	 if (Schema:GetName() == "HL2 RP" and Schema:PlayerIsCombine(player)) then
	 hands:ClockworkSetModel("models/weapons/c_arms_combine.mdl");
	 else
	 hands:ClockworkSetModel("models/weapons/c_arms_citizen.mdl");
	 end;
	 end;
	 end);
	 end;
 end;