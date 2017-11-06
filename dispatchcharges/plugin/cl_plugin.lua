local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.datastream:Hook("DispCharges", function(data)
	if (Schema.dispChargesPanel and Schema.dispChargesPanel:IsValid()) then
		Schema.dispChargesPanel:Close();
		Schema.dispChargesPanel:Remove();
	end;

	Schema.dispChargesPanel = vgui.Create("cwDispCharges");
	Schema.dispChargesPanel:Populate(PLUGIN.chargesData);
	Schema.dispChargesPanel:MakePopup();

	gui.EnableScreenClicker(true);
end);
