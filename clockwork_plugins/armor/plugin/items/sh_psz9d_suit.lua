local ITEM = Clockwork.item:New("armor_clothes_base");
ITEM.name = "PSZ-9d Armored Suit";
ITEM.uniqueID = "psz9d_suit";
ITEM.actualWeight = 6;
ITEM.invSpace = 8;
ITEM.radiationResistance = 0.4;
ITEM.maxArmor = 100;
ITEM.protection = 0.6;
ITEM.hasGasmask = true;
ITEM.business = false;
ITEM.replacement = "models/stalkertnb/psz9d_grey.mdl";
ITEM.description = "A full Personal Protection System Model 9 Suit.";
ITEM.faction = "Loner";
ITEM.access = "";

ITEM.replacementmale = {}
ITEM.replacementmale[1] = "models/stalkertnb/psz9d_grey.mdl"
ITEM.replacementmale[2] = "models/stalkertnb/psz9d_pool.mdl"
ITEM.replacementmale[3] = "models/stalkertnb/psz9d_sacriel.mdl"
ITEM.replacementmale[4] = "models/stalkertnb/psz9d_dreadlocks.mdl"
ITEM.replacementmale[5] = "models/stalkertnb/psz9d_helios.mdl"
ITEM.replacementmale[6] = "models/stalkertnb/psz9d_jack.mdl"
ITEM.replacementmale[7] = "models/stalkertnb/psz9d_midnight.mdl"

ITEM.replacementfemale = {}
ITEM.replacementfemale[1] = "models/stalkertnb/psz9d_eldeos.mdl"
ITEM.replacementfemale[2] = "models/stalkertnb/psz9d_wolfy.mdl"

ITEM:Register();