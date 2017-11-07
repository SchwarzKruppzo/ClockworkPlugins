local ITEM = Clockwork.item:New("armor_clothes_base");
ITEM.name = "Radiation Suit";
ITEM.uniqueID = "radiation_suit";
ITEM.actualWeight = 20;
ITEM.invSpace = 4;
ITEM.radiationResistance = 1;
ITEM.maxArmor = 25;
ITEM.protection = 0.1;
ITEM.hasGasmask = true;
ITEM.business = false;
ITEM.replacement = "models/stalkertnb/rad_lone.mdl"
ITEM.description = "A full radiation suit.";
ITEM.faction = "Loner";
ITEM.access = "";

ITEM.replacementmale = {}
ITEM.replacementmale[1] = "models/stalkertnb/rad_wolfie.mdl"
ITEM.replacementmale[2] = "models/stalkertnb/rad_altair.mdl"
ITEM.replacementmale[3] = "models/stalkertnb/rad_bear.mdl"
ITEM.replacementmale[4] = "models/stalkertnb/rad_cobr.mdl"
ITEM.replacementmale[5] = "models/stalkertnb/rad_daniel.mdl"
ITEM.replacementmale[6] = "models/stalkertnb/rad_general.mdl"
ITEM.replacementmale[7] = "models/stalkertnb/rad_grizzly.mdl"
ITEM.replacementmale[8] = "models/stalkertnb/rad_helios.mdl"
ITEM.replacementmale[9] = "models/stalkertnb/rad_hellfang1.mdl"
ITEM.replacementmale[10] = "models/stalkertnb/rad_hellfang2.mdl"
ITEM.replacementmale[11] = "models/stalkertnb/rad_iron.mdl"
ITEM.replacementmale[12] = "models/stalkertnb/rad_lone.mdl"
ITEM.replacementmale[13] = "models/stalkertnb/rad_bean.mdl"

ITEM.replacementfemale = {}
ITEM.replacementfemale[1] = "models/stalkertnb/rad_zoya.mdl"
ITEM.replacementfemale[2] = "models/stalkertnb/rad_eagle.mdl"
ITEM.replacementfemale[3] = "models/stalkertnb/rad_lone.mdl"
ITEM.replacementfemale[4] = "models/stalkertnb/rad_bean.mdl"

ITEM:Register();