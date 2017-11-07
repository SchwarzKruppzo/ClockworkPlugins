local PERK = Atomic.perks:New();

PERK.name = "Swift Learner";
PERK.icon = "atomic/hud/perks/swift_learner.png";
PERK.description = "You learn quick on your feet, progressing skills twice as fast as normal.";

if (SERVER) then
	-- Called when an attribute gains progress to adjust how much is progressed.
	function PERK.module:OnAttributeProgress(player, attribute, amount)
		if (player:HasPerk(PERK.name)) then
			amount = amount * 2;
		end;
	end;
end;

PERK:Register();