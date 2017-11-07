--[[
This work is licensed under a Creative Commons
Attribution-ShareAlike 4.0 International License.

Created by 8bitMafia.
--]]

util.AddNetworkString("cwRequestSound")
util.AddNetworkString("cwBroadcastSound")
util.AddNetworkString("cwOpenSoundMenu")

net.Receive("cwRequestSound", function(len, ply)
	local path = net.ReadString()

	if (Clockwork.player:IsAdmin(ply)) then
		net.Start("cwBroadcastSound")
		net.WriteString(path)
		net.Broadcast()
	end
end)