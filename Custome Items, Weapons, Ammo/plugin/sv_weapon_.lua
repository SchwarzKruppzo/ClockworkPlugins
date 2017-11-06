local PLUGIN = PLUGIN;
-- this is the weapon item lua file
local ITEM = Clockwork.item:New("weapon_base"); --This is the item base, this one in particular is a weapon_base
        ITEM.name = ""; --The name of the item, example: "M14 Carbine"
        ITEM.cost = ; --The cost of the item. The number must be connected to the semi colon, example: "= 999;"
        ITEM.model = ""; --The model of which the item is viewed in the inventory and on self.
        ITEM.weight = ; --The weight of the item. The number must be connected to the semi colon, example: "= 999;"
		ITEM.access = ""; --The flag which allows this weapon to be accessed from menus.
        ITEM.business = true/false; --PICK ONE. Whether or not this item is accessible from the business menu.
        ITEM.uniqueID = ""; --CW item. The identifier which is called out in other scripts. Goes in between the brackets.
        ITEM.description = ""; --The description of the weapon.
        ITEM.isAttachment = true/false; --PICK ONE. Whether or not the item can be viewed by others when the player equips it.
        ITEM.hasFlashlight = true/false; --PICK ONE. Obvious... whether or not this weapon has a flashlight.
	ITEM.loweredOrigin = Vector(3, 0, -4); --Vector/position of which the item is lowered when equiped.
	ITEM.loweredAngles = Angle(0, 45, 0); --The angle which the weapon is at when lowered when equiped.
        ITEM.attachmentBone = "ValveBiped.Bip01_Spine"; --The location of which the weapon is attached when holstered. In this case it'll be on the spine.
        ITEM.attachmentOffsetAngles = Angle(0, 0, 90); --The angle which the weapon is at when holstered.
        ITEM.attachmentOffsetVector = Vector(-2, 5, 4); --The vector/position of where the item is on the attachment (spine)
ITEM:Register(); --leave alone.