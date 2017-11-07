local PLUGIN = PLUGIN

function PLUGIN:ChatBoxAdjustInfo(info)
	if info.class == "radio" or info.class == "request" then
		local speaker = info.speaker
		if speaker:GetSharedVar("affectedbyjam") then
			-- Set the name in the message to ???, for some reason this doesn't work when executed serverside.
			info.name = "???"
		end
	end
end