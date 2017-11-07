--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.cost = 999;
	ITEM.health = 200;
	ITEM.name = "Maria";
	ITEM.category = "Small Guns";
	ITEM.model = "models/Halokiller38/fallout/weapons/Pistols/9mmunique.mdl";
	ITEM.batch = 1;
	ITEM.weight = 1.5;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.weaponClass = "weapon_9mmpistolmaria";
	ITEM.description = "A little unique pistol.\nThis firearm utilises 9mm ammunition.";
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
	ITEM.attachmentOffsetAngles = Angle(-180, 180, 90);
	ITEM.attachmentOffsetVector = Vector(-4.19, 0, -8.54);
	ITEM.loweredAngles = Angle(-35, 10, -14);
ITEM:Register();