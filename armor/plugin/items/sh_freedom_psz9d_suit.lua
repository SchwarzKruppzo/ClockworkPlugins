local ITEM = Clockwork.item:New("armor_clothes_base");
ITEM.name = "PSZ-9d Armored Freedom Suit";
ITEM.uniqueID = "freedom_psz9d_suit";
ITEM.actualWeight = 6;
ITEM.invSpace = 8;
ITEM.radiationResistance = 0.4;
ITEM.maxArmor = 100;
ITEM.protection = 0.6;
ITEM.hasGasmask = true;
ITEM.business = false;
ITEM.replacement = "models/stalkertnb/psz9d_free.mdl";
ITEM.model = "models/stalkertnb/outfits/psz9d_free.mdl"
ITEM.description = "A full Personal Protection System Model 9 Freedom Suit.";
ITEM.faction = "Freedom";
ITEM.access = "f";

ITEM.replacementmale = {}
ITEM.replacementmale[1] = "models/stalkertnb/psz9d_free.mdl"
ITEM.replacementmale[2] = "models/stalkertnb/psz9d_free2.mdl"
ITEM.replacementmale[3] = "models/stalkertnb/psz9d_free3.mdl"
ITEM.replacementmale[4] = "models/stalkertnb/psz9d_free4.mdl"

ITEM.replacementfemale = {}
ITEM.replacementfemale[1] = "models/stalkertnb/psz9d_free.mdl"
ITEM.replacementfemale[2] = "models/stalkertnb/psz9d_free2.mdl"
ITEM.replacementfemale[3] = "models/stalkertnb/psz9d_free4.mdl"
ITEM.replacementfemale[4] = "models/stalkertnb/psz9d_free_bird.mdl"
ITEM.replacementfemale[5] = "models/stalkertnb/psz9d_free_cawlin.mdl"
ITEM.replacementfemale[6] = "models/stalkertnb/psz9d_free_rensai.mdl"
ITEM.replacementfemale[7] = "models/stalkertnb/psz9d_brandon.mdl"

ITEM:Register();