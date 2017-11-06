--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("grenade_base");
	ITEM.name = "Grenade";
	ITEM.cost = 50;
	ITEM.model = "models/items/grenadeammo.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "V";
	ITEM.classes = {CLASS_EOW};
	ITEM.uniqueID = "weapon_frag";
	ITEM.business = true;
	ITEM.description = "A dirty tube of dust, is this supposed to be a grenade?";
	ITEM.isAttachment = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(10, 0, -10);
	ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
	ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);
ITEM:Register();