--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Cosmos Cassette No. 1";
ITEM.uniqueID = "cassette_cosmos1";
ITEM.cost = 25;
ITEM.model = "models/devcon/mrp/props/casette.mdl";
ITEM.weight = .05;
ITEM.access = "V";
ITEM.category = "Music";
ITEM.business = true;
ITEM.description = "It's a cassette, with a label that reads: Cosmos No. 1 <color='2B62E3'>This item is legal.</color>";
ITEM.isCassette = true;
ITEM.key = t_cassette.Register("Cosmos", {
		{
			name = "Heaven and Hell",
			length = 203,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/cosmos/heaven_and_hell.mp3"
		},
		{
			name = "Alpha",
			length = 159,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/cosmos/alpha.mp3"
		},
		{
			name = "Canon in D",
			length = 199,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/cosmos/canon_in_d.mp3"
		},
		{
			name = "Fly Night Bird",
			length = 80,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/cosmos/fly_night_bird.mp3"
		},
		{
			name = "Legacy",
			length = 144,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/cosmos/legacy.mp3"
		},
		{
			name = "Spring",
			length = 196,
			url = "https://dl.dropboxusercontent.com/u/58860844/music/cosmos/spring.mp3"
		}
	})

function ITEM:OnDrop(player, position)
end;

ITEM:Register();