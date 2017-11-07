local ITEM = Clockwork.item:New("armor_clothes_base");
ITEM.name = "Duty Radiation Suit";
ITEM.uniqueID = "duty_radiation_suit";
ITEM.actualWeight = 20;
ITEM.invSpace = 4;
ITEM.radiationResistance = 1;
ITEM.maxArmor = 25;
ITEM.protection = 0.1;
ITEM.hasGasmask = true;
ITEM.business = false;
ITEM.replacement = "models/stalkertnb/rad_duty.mdl"
ITEM.description = "A full Duty radiation suit.";
ITEM.faction = "DUTY";
ITEM.access = "F";

ITEM.replacementmale = {}
ITEM.replacementmale[1] = "models/stalkertnb/rad_duty.mdl"
ITEM.replacementmale[2] = "models/stalkertnb/rad_crysis.mdl"

ITEM.replacementfemale = {}
ITEM.replacementfemale[1] = "models/stalkertnb/rad_duty.mdl"

ITEM:Register();