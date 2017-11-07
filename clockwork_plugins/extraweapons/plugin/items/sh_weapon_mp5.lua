 --[[
© 2013 CloudSixteen.com do not share, re-distribute or modify
without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
ITEM.name = "MP5";
ITEM.cost = 400;
ITEM.model = "models/weapons/w_smg_mp5.mdl";
ITEM.weight = 4;
ITEM.uniqueID = "rcs_mp5";
ITEM.business = true;
ITEM.description = " ";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-3.96, 4.95, -2.97);
ITEM:Register();