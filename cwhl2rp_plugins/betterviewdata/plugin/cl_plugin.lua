local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.datastream:Hook("EditData", function(data)
	if (IsValid( data[1] )) then
		if (Schema.dataPanel and Schema.dataPanel:IsValid()) then
			Schema.dataPanel:Close();
			Schema.dataPanel:Remove();
		end;

		Schema.dataPanel = vgui.Create("cwData");
		Schema.dataPanel:Populate(data[1], data[2] or "", data[3] or {}, data[4] or "");
		Schema.dataPanel:MakePopup();

		gui.EnableScreenClicker(true);
	end;
end);
