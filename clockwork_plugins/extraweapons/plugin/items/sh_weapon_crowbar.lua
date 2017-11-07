 --[[
© 2013 CloudSixteen.com do not share, re-distribute or modify
without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
ITEM.name = "Crowbar";
ITEM.cost = 100;
ITEM.model = "models/weapons/w_crowbar.mdl";
ITEM.weight = 4;
ITEM.uniqueID = "weapon_crowbar";
ITEM.business = true;
ITEM.description = " The same thing Gordon likes.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(0, 0, 90);
ITEM.attachmentOffsetVector = Vector(0, 4, -8);
ITEM:Register();