local ITEM = Clockwork.item:New("armor_clothes_base");
ITEM.name = "PSZ-9d Ecologist Armored Suit";
ITEM.uniqueID = "ecologist_psz9d_suit";
ITEM.actualWeight = 6;
ITEM.invSpace = 8;
ITEM.radiationResistance = 0.4;
ITEM.maxArmor = 100;
ITEM.protection = 0.6;
ITEM.gasmask = true;
ITEM.business = false;
ITEM.replacement = "models/stalkertnb/psz9d_ecologist1.mdl";
ITEM.description = "A full Personal Protection System Model 9 Ecologist Suit.";
ITEM.faction = "Ecologists";
ITEM.access = "E";

ITEM.replacementmale = {}
ITEM.replacementmale[1] = "models/stalkertnb/psz9d_ecologist1.mdl"
ITEM.replacementmale[2] = "models/stalkertnb/psz9d_ecologist2.mdl"
ITEM.replacementmale[3] = "models/stalkertnb/psz9d_ecologist3.mdl"
ITEM.replacementmale[4] = "models/stalkertnb/psz9d_ecologist4.mdl"

ITEM:Register();