local PLUGIN = PLUGIN;

util.AddNetworkString("waypointmarker")
util.AddNetworkString("deathmarker")
util.AddNetworkString("requestmarker")

function PLUGIN:Tick()
	for k, v in ipairs( _player.GetAll() ) do
		if (v:HasInitialized() and (v:GetFaction() == "Metropolice Force" or v:GetFaction() == "Overwatch Transhuman Arm") and !v:Alive()) then
			local strings = {name = v:Name(), msg = false}
			local location = v:GetPos()
			local transmitstring = util.TableToJSON(strings)
			net.Start("deathmarker")
				net.WriteVector(location)
				net.WriteString(transmitstring)
			net.Broadcast()
		end
	end;
end;