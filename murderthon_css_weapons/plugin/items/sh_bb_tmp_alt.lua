local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "TMP";
	ITEM.cost = 0;
	ITEM.model = "models/weapons/3_smg_tmp.mdl";
	ITEM.weight = 2;
	ITEM.uniqueID = "bb_tmp_alt";
	ITEM.business = false;
	ITEM.description = "A light SMG with an irremovable silencer. Good for stealth.";
	ITEM.isAttachment = false;
ITEM:Register();