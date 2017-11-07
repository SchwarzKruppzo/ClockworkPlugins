local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	self:SetBackgroundBlur(true);
	self:SetDeleteOnClose(false);
	self:SetTitle("Dispatch Charges");

	-- Called when the button is clicked.
	function self.btnClose.DoClick(button)
		self:Close();
		self:Remove();

		gui.EnableScreenClicker(false);
	end;
end;

-- Called each frame.
function PANEL:Think()
	local scrW = ScrW();
	local scrH = ScrH();

	self:SetSize(360, 480);
	self:SetPos( (scrW / 2) - (self:GetWide() / 2), (scrH / 2) - (self:GetTall() / 2) );
end;

-- A function to populate the panel.
function PANEL:Populate(chargesData)
   local doneButton = vgui.Create("DButton", self);
   doneButton:SetText("Emit");
   doneButton:DockMargin(0, 4, 0, 0);
   doneButton:Dock(BOTTOM);

	local scrollPanel = vgui.Create("DScrollPanel", self);
   scrollPanel:Dock(FILL);

		self.chargesCheckboxes = {};

		for i, data in ipairs(chargesData) do
			local checkBox = vgui.Create("DCheckBoxLabel", scrollPanel);
			checkBox:SetPos(8, 8 + ((i - 1) * 20));
			checkBox:SetText(data[2]);
			checkBox:SetValue(0);
			checkBox:SizeToContents();
			self.chargesCheckboxes[i] = checkBox;
		end;

	-- Called when the button is clicked.
	function doneButton.DoClick(button)
		local selectedCharges = {};

		for i, checkbox in ipairs(self.chargesCheckboxes) do
			if checkbox:GetChecked() then
				table.insert(selectedCharges, i);
			end;
		end;

		self:Close();
		self:Remove();

		Clockwork.datastream:Start( "DispCharges", { selectedCharges } );

		gui.EnableScreenClicker(false);
	end;
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	DFrame.PerformLayout(self);
end;

vgui.Register("cwDispCharges", PANEL, "DFrame");
