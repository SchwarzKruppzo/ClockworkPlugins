--[[
© 2013 CloudSixteen.com do not share, re-distribute or modify
without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
ITEM.name = "Combine Sniper"
ITEM.cost = 1500;
ITEM.model = "models/weapons/w_combinesniper_e2.mdl";
ITEM.weight = 8;
ITEM.uniqueID = "grub_combine_sniper";
ITEM.business = true;
ITEM.description = "A combine-manufactured sniper rifle with a laser-assist aiming. It can be used by humans.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-3.96, 4.95, -2.97);
ITEM:Register();
