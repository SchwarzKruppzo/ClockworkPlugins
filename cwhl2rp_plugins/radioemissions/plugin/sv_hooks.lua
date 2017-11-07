function radioEmission:ChatBoxAdjustInfo(info)
	if info.class == "radio" then
		local s = info.speaker
		local prefix = ""
		for k,v in pairs( info.listeners ) do
			for k2,v2 in pairs( player.GetAll() ) do
				if v2:IsValid() and v2:HasInitialized() then
					if v2:GetPos():Distance( v:GetPos() ) <= Clockwork.config:Get( "talk_radius" ):Get()/1.5 and v2 != v then
						if Schema:PlayerIsCombine( s ) then
							prefix = "<:: "
						end
						Clockwork.chatBox:SendColored( v2, Color(75, 150, 50, 255), v:Name().." emits \""..prefix..info.text.."\"" )
					end
				end
			end
		end
	end
end