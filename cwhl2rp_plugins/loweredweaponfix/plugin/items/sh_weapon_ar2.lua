--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Pulse-Rifle";
	ITEM.cost = 400;
	ITEM.model = "models/weapons/w_irifle.mdl";
	ITEM.weight = 4;
	ITEM.classes = {CLASS_EOW};
	ITEM.uniqueID = "weapon_ar2";
	ITEM.business = true;
	ITEM.description = "A weapon which does not seem to have been crafted on Earth.";
	ITEM.isAttachment = true;
	ITEM.hasFlashlight = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(10, 0, -10);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-3.96, 4.95, -2.97);
ITEM:Register();