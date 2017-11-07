--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Cosmos Cassette No. 2";
ITEM.uniqueID = "cassette_cosmos2";
ITEM.cost = 25;
ITEM.model = "models/devcon/mrp/props/casette.mdl";
ITEM.weight = .05;
ITEM.access = "V";
ITEM.category = "Music";
ITEM.business = true;
ITEM.description = "It's a cassette, with a label that reads: Cosmos No. 2 <color='2B62E3'>This item is legal.</color>";
ITEM.isCassette = true;
ITEM.key = t_cassette.Register("Cosmos - Neil", {
		{
			name = "All that ever will be",
			length = 93,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/cosmos_new/all_that_ever_will_be.mp3"
		},
		{
			name = "Giordano Bruno",
			length = 159,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/cosmos_new/giordano_bruno.mp3"
		},
		{
			name = "State of the Stars",
			length = 196,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/cosmos_new/state_of_the_stars.mp3"
		},
		{
			name = "He broke through",
			length = 169,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/cosmos_new/he_broke_through.mp3"
		},
	})

function ITEM:OnDrop(player, position)
end;

ITEM:Register();