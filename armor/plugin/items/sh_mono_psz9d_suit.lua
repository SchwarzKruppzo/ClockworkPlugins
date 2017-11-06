local ITEM = Clockwork.item:New("armor_clothes_base");
ITEM.name = "PSZ-9d Monolith Armored Suit";
ITEM.uniqueID = "mono_psz9d_suit"
ITEM.actualWeight = 6;
ITEM.invSpace = 8;
ITEM.radiationResistance = 0.4;
ITEM.maxArmor = 100;
ITEM.protection = 0.6;
ITEM.hasGasmask = true;
ITEM.business = false;
ITEM.replacement = "models/stalkertnb/psz9d_mono3.mdl"
ITEM.model = "models/stalkertnb/outfits/psz9d_monolith.mdl"
ITEM.description = "A full Personal Protection System Model 9 Monolith Suit.";
ITEM.faction = "Monolith";
ITEM.access = "m";

ITEM.replacementmale = {}
ITEM.replacementmale[1] = "models/stalkertnb/psz9d_mono.mdl"
ITEM.replacementmale[2] = "models/stalkertnb/psz9d_mono2.mdl"
ITEM.replacementmale[3] = "models/stalkertnb/psz9d_mono3.mdl"
ITEM.replacementmale[4] = "models/stalkertnb/psz9d_mono4.mdl"

ITEM.replacementfemale = {}
ITEM.replacementfemale[1] = "models/stalkertnb/psz9d_reager.mdl"

ITEM:Register();