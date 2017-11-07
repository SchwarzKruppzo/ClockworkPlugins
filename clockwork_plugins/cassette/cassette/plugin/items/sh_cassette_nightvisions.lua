--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Slow Cassette";
ITEM.uniqueID = "cassette_nightvisions";
ITEM.cost = 25;
ITEM.model = "models/devcon/mrp/props/casette.mdl";
ITEM.weight = .05;
ITEM.access = "V";
ITEM.category = "Music";
ITEM.business = true;
ITEM.description = "An old album cassette that has been lovingly cared to over the years. <color='2B62E3'>This item is legal.</color>";
ITEM.isCassette = true;
ITEM.key = t_cassette.Register("Night Visions", {
	{
		name = "Bad Girls Club",
		length = 220,
		url = "https://dl.dropboxusercontent.com/s/wifz2fm05ue3200/badgirlsclub.mp3"
	},
	{
		name = "Shadow Of The Day",
		length = 259,
		url = "https://dl.dropboxusercontent.com/s/e5sd9acdc4si66r/shadowoftheday1.mp3"
	},
	{
		name = "You're Gonna' Go Far Kid",
		length = 181,
		url = "https://dl.dropboxusercontent.com/s/1y3jm0s244rbhiq/youregonnagofarkid.mp3"
	},
	{
		name = "Weak When Ur Around Me",
		length = 167,
		url = "https://dl.dropboxusercontent.com/s/wtgpeex5twv8j79/weakwhenuraround.mp3"
	},
	{
		name = "Two Is Better Then One",
		length = 242,
		url = "https://dl.dropboxusercontent.com/s/37p7zlmyp8u2p5i/twoisbetterthanone.mp3"
	}
})

function ITEM:OnDrop(player, position)
end;

ITEM:Register();