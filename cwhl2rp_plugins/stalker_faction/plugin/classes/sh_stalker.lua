local CLASS = Clockwork.class:New("Stalker")

CLASS.color = Color(187, 89, 28, 255);
CLASS.wages = false;
CLASS.factions = {FACTION_STALKER};
CLASS.description = "A Stalker. Once time it was a rebel."
CLASS.defaultPhysDesc = "An brainwashed, transformed human into a brown mechanical stalker."

CLASS_STALKER = CLASS:Register();