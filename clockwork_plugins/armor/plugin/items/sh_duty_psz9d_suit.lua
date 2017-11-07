local ITEM = Clockwork.item:New("armor_clothes_base");
ITEM.name = "PSZ-9d Duty Armored Suit";
ITEM.uniqueID = "duty_psz9d_suit";
ITEM.actualWeight = 6;
ITEM.invSpace = 8;
ITEM.radiationResistance = 0.4;
ITEM.maxArmor = 100;
ITEM.protection = 0.6;
ITEM.hasGasmask = true;
ITEM.business = false;
ITEM.replacement = "models/stalkertnb/psz9d_duty3.mdl"
ITEM.model = "models/stalkertnb/outfits/psz9d_duty.mdl";
ITEM.description = "A full Personal Protection System Model 9 Duty Suit.";
ITEM.faction = "DUTY";
ITEM.access = "F";

ITEM.replacementmale = {}
ITEM.replacementmale[1] = "models/stalkertnb/psz9d_duty.mdl"
ITEM.replacementmale[2] = "models/stalkertnb/psz9d_duty2.mdl"
ITEM.replacementmale[3] = "models/stalkertnb/psz9d_duty3.mdl"
ITEM.replacementmale[4] = "models/stalkertnb/psz9d_duty4.mdl"
ITEM.replacementmale[5] = "models/stalkertnb/psz9d_zgubba.mdl"
ITEM.replacementmale[6] = "models/stalkertnb/psz9d_storm.mdl"
ITEM.replacementmale[7] = "models/stalkertnb/psz9d_kibwe.mdl"
ITEM.replacementmale[8] = "models/stalkertnb/psz9d_makarov.mdl"

ITEM.replacementfemale = {}
ITEM.replacementfemale[1] = "models/stalkertnb/psz9d_ybarra2.mdl"
ITEM.replacementfemale[2] = "models/stalkertnb/psz9d_blonde.mdl"
ITEM.replacementfemale[3] = "models/stalkertnb/psz9d_nazca.mdl"

ITEM:Register();