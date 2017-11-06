local ITEM = Clockwork.item:New("armor_clothes_base");
ITEM.name = "Ecologist Radiation Suit";
ITEM.uniqueID = "ecologist_radiation_suit";
ITEM.actualWeight = 10;
ITEM.invSpace = 6;
ITEM.radiationResistance = 0.75;
ITEM.maxArmor = 80;
ITEM.protection = 0.5;
ITEM.gasmask = true;
ITEM.business = false;
ITEM.replacement = "models/stalkertnb/rad_ecol.mdl"
ITEM.description = "A full Ecologist radiation suit.";
ITEM.faction = "Ecologist";
ITEM.access = "E";

ITEM.replacementmale = {}
ITEM.replacementmale[1] = "models/stalkertnb/rad_ecol.mdl"

ITEM.replacementfemale = {}
ITEM.replacementfemale[1] = "models/stalkertnb/rad_ecol.mdl"

ITEM:Register();