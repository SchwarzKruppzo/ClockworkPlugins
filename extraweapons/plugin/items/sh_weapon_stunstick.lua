--[[
© 2013 CloudSixteen.com do not share, re-distribute or modify
without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
ITEM.name = "Stunstick"
ITEM.cost = 90000;
ITEM.model = "models/weapons/w_stunbaton.mdl";
ITEM.weight = 1;
ITEM.uniqueID = "cw_stunstick";
ITEM.business = true;
ITEM.description = "A metal rod with a bloated end, it emits a shock charge.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(0, 0, 90);
ITEM.attachmentOffsetVector = Vector(0, 4, -8);
ITEM:Register();