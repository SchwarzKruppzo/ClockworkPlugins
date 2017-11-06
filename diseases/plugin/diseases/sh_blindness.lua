local DISEASE = Clockwork.disease:New("Blindness");
DISEASE.description = "A complete loss of one of your five senses.";
DISEASE.incubationTime = 0;
DISEASE.infectuous = false;
DISEASE.chronic = true;

function DISEASE:OnInit(player)
	local function blind()
		alpha = Lerp(FrameTime()*10, alpha, 255);
		draw.RoundedBox(0, 0, 0, ScrW(), ScrH(), Color(0, 0, 0));
	end;
	hook.Add("HUDPaint", "cwDiseases_blindness", blind);
end;

function DISEASE:OnIncubationEnd(player)
	local alpha = 0;
	local function blind()
		alpha = Lerp(FrameTime()*10, alpha, 255);
		draw.RoundedBox(0, 0, 0, ScrW(), ScrH(), Color(0, 0, 0, alpha));
	end;
	hook.Add("HUDPaint", "cwDiseases_blindness", blind);
end;

function DISEASE:OnUnload(player)
	hook.Remove("HUDPaint", "cwDiseases_blindness");
end;

DISEASE:Register();