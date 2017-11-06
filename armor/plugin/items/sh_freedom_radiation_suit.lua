local ITEM = Clockwork.item:New("armor_clothes_base");
ITEM.name = "Freedom Radiation Suit";
ITEM.uniqueID = "freedom_radiation_suit";
ITEM.actualWeight = 10;
ITEM.invSpace = 6;
ITEM.radiationResistance = 0.75;
ITEM.maxArmor = 100;
ITEM.protection = 0.5;
ITEM.gasmask = true;
ITEM.business = false;
ITEM.replacement = "models/stalkertnb/rad_free.mdl"
ITEM.description = "A full Freedom radiation suit.";
ITEM.faction = "Freedom";
ITEM.access = "f";

ITEM.replacementmale = {}
ITEM.replacementmale[1] = "models/stalkertnb/rad_free.mdl"

ITEM.replacementfemale = {}
ITEM.replacementfemale[1] = "models/stalkertnb/rad_free.mdl"

ITEM:Register();