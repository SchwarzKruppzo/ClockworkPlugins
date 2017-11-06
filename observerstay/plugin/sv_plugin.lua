--[[
	Makes players exit observer mode without sending them back to their original location.
	Observer exit by kurozael. I just edited it.
--]]

-- A function to make a player exit observer mode.
function cwObserverStay:MakePlayerExitObserverMode(player)

	player.cwObserverReset = true;
	player:DrawWorldModel(true);
	player:DrawShadow(true);
	player:SetNoDraw(false);
	player:SetNotSolid(false);
	player:SetMoveType(player.cwObserverMoveType or MOVETYPE_WALK);
	
	timer.Simple(FrameTime() * 0.5, function()
		if (IsValid(player)) then
			
		
			
			if (player.cwObserverColor) then
				player:SetColor(player.cwObserverColor);
			end;
			
			player.cwObserverMoveType = nil;
			player.cwObserverReset = nil;
			player.cwObserverPos = nil;
			player.cwObserverAng = nil;
			player.cwObserverMode = nil;
		end;
	end);
end;
