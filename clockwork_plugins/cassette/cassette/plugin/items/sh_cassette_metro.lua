--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Metro Cassette";
ITEM.uniqueID = "cassette_metro";
ITEM.cost = 25;
ITEM.model = "models/devcon/mrp/props/casette.mdl";
ITEM.weight = .05;
ITEM.access = "V";
ITEM.category = "Music";
ITEM.business = true;
ITEM.description = "It's a cassette, with a dusty label that reads: Metro <color='2B62E3'>This item is legal.</color>";
ITEM.isCassette = true;
ITEM.key = t_cassette.Register("Metro", {
	{
		name = "Private Fears In Public Places",
		length = 305,
		url = "https://dl.dropboxusercontent.com/s/efxu6rrzf82fosj/privatefearspublicplaces.mp3"
	},
	{
		name = "Not Good Enough For The Truth In Cliche",
		length = 240,
		url = "https://dl.dropboxusercontent.com/s/ikisfym1n1j619n/notgoodenoughforthetruth.mp3"
	},
	{
		name = "Losing It",
		length = 210,
		url = "https://dl.dropboxusercontent.com/s/8lrigs36zy17ze4/losingit.mp3"
	},
	{
		name = "Idfc",
		length = 205,
		url = "https://dl.dropboxusercontent.com/s/o8mkt19zeci9mt8/idfc.mp3"
	},
	{
		name = "You Had Me At Hello",
		length = 266,
		url = "https://dl.dropboxusercontent.com/s/3l4lsds4k2iyhki/youhadmeathello.mp3"
	},
	{
		name = "Rumours",
		length = 185,
		url = "https://dl.dropboxusercontent.com/s/zvkznsecu0upc9n/rumours.mp3"
	}
})

function ITEM:OnDrop(player, position)
end;

ITEM:Register();