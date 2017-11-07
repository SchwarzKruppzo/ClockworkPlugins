--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Swe Top Cassette";
ITEM.uniqueID = "cassette_swetop";
ITEM.cost = 25;
ITEM.model = "models/devcon/mrp/props/casette.mdl";
ITEM.weight = .05;
ITEM.access = "V";
ITEM.category = "Music";
ITEM.business = true;
ITEM.description = "It's a cassette, with a rather new label that reads: Swe Top <color='2B62E3'>This item is legal.</color>";
ITEM.isCassette = true;
ITEM.key = t_cassette.Register("Swe Top", {
		{
			name = "Uptown Funk",
			length = 270,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/swetoplist/uptown_funk.mp3"
		},
		{
			name = "Firestone",
			length = 270,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/swetoplist/firestone.mp3"
		},
		{
			name = "The Nights",
			length = 175,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/swetoplist/the_nights.mp3"
		},
	})

function ITEM:OnDrop(player, position)
end;

ITEM:Register();