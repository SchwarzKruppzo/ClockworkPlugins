--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Combine Sniper";
	ITEM.cost = 900;
	ITEM.model = "models/weapons/w_combinesniper_e2.mdl";
	ITEM.weight = 2.5;
	ITEM.access = "V";
	ITEM.uniqueID = "grub_combine_sniper";
	ITEM.business = true;
	ITEM.description = "A large and metal flamethrower with a red tip, there is a small flame coming from the side. It uses Pulse-Rifle Energy as ammo.";
	ITEM.isAttachment = true;
	ITEM.hasFlashlight = false;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(0, 45, 0);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-3.96, 4.95, -2.97);
ITEM:Register();