local ITEM = Clockwork.item:New("armor_clothes_base");
ITEM.name = "Mercenary Radiation Suit";
ITEM.uniqueID = "merc_radiation_suit";
ITEM.actualWeight = 10;
ITEM.invSpace = 6;
ITEM.radiationResistance = 0.75;
ITEM.maxArmor = 100;
ITEM.protection = 0.5;
ITEM.gasmask = true;
ITEM.business = false;
ITEM.replacement = "models/stalkertnb/rad_merc.mdl"
ITEM.description = "A full Mercenary radiation suit.";
ITEM.faction = "Mercenary";
ITEM.access = "";

ITEM.replacementmale = {}
ITEM.replacementmale[1] = "models/stalkertnb/rad_captd.mdl"
ITEM.replacementmale[1] = "models/stalkertnb/rad_merc.mdl"

ITEM.replacementfemale = {}
ITEM.replacementfemale[1] = "models/stalkertnb/rad_merc.mdl"

ITEM:Register();