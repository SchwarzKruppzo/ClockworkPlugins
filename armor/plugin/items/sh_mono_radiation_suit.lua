local ITEM = Clockwork.item:New("armor_clothes_base");
ITEM.name = "Monolith Radiation Suit";
ITEM.uniqueID = "mono_radiation_suit";
ITEM.actualWeight = 10;
ITEM.invSpace = 6;
ITEM.radiationResistance = 0.75;
ITEM.maxArmor = 100;
ITEM.protection = 0.5;
ITEM.gasmask = true;
ITEM.business = false;
ITEM.replacement = "models/stalkertnb/rad_mono.mdl"
ITEM.description = "A full Monolith radiation suit.";
ITEM.faction = "Monolith";
ITEM.access = "m";

ITEM.replacementmale = {}
ITEM.replacementmale[1] = "models/stalkertnb/rad_mono.mdl"

ITEM.replacementfemale = {}
ITEM.replacementfemale[1] = "models/stalkertnb/rad_mono.mdl"

ITEM:Register();