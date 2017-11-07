local COMMAND = Clockwork.command:New("NewPHANTOM");
COMMAND.tip = "Makes a new undercover identity (For PHANTOMs)";
COMMAND.text = "<string Name> <string Description>";
COMMAND.arguments = 2;
function COMMAND:OnRun(player, arguments)
	local faction = player:GetFaction();
	if (Schema:IsCombineFaction(faction)) then
		if(player:GetCharacterData("PHANTOMUndercover") != true) then
			if(string.find(player:Name(), "PHANTOM")) then
				local name = arguments[1];
				if(name) then
					local physDesc = arguments[2];
					if(physDesc) then
						player:SetCharacterData("UndercoverName", name);
						player:SetCharacterData("UndercoverPhysDesc", physDesc);
						Clockwork.player:Notify(player, "New identity created.");
					else
						Clockwork.player:Notify(player, "Invalid physical description.");
					end;
				else
					Clockwork.player:Notify(player, "You must specify a name.");
				end;
			else	
				Clockwork.player:Notify(player, "You are not a PHANTOM!");
			end;
		else
			Clockwork.player:Notify(player, "You cannot do this whilst undercover!");
		end;
	else
		Clockwork.player:Notify(player, "You are not in the MPF!");
	end;
end;
COMMAND:Register();