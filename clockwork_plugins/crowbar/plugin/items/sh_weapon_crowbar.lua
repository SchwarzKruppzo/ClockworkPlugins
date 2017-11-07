--[[
	Screw your green text!
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Crowbar";
	ITEM.cost = 200;
	ITEM.model = "models/weapons/w_crowbar.mdl";
	ITEM.weight = 2;
	ITEM.access = "v";
	ITEM.uniqueID = "weapon_crowbar";
	ITEM.business = true;
	ITEM.isMeleeWeapon = true;
	ITEM.description = "A rusty old crowbar.";
	ITEM.spawncategory = 7;
	ITEM.isAttachment = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(0, 45, 0);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-2, 5, 4);
ITEM:Register();