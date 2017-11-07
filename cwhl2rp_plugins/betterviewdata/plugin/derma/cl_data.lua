local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	self:SetBackgroundBlur(true);
	self:SetDeleteOnClose(false);

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

	self:SetSize(720, 480);
	self:SetPos( (scrW / 2) - (self:GetWide() / 2), (scrH / 2) - (self:GetTall() / 2) );
end;

-- A function to populate the panel.
function PANEL:Populate(player, data, pointTable, CID)
	local title = player:Name();

	if string.len(tostring(CID)) > 0 then
		title = title .. ", #" .. CID;
	else
		CID = "n/a";
	end;

	self:SetTitle( title );

	self.dataPoints = pointTable;
	self.dataName = player:Name();
	self.dataCID = CID;

	local width = 720 - 10;

   local doneButton = vgui.Create("DButton", self);
   doneButton:SetText("Done");
   doneButton:DockMargin(0, 4, 0, 0);
   doneButton:Dock(BOTTOM);

	local leftDock = vgui.Create("Panel", self);
   leftDock:SetSize(width * 0.4 - 4, 0);
   leftDock:Dock(LEFT);

		local infoBackground = vgui.Create("DPanel", leftDock);
		infoBackground:SetSize(0, 100);
		infoBackground:Dock(TOP);
		infoBackground:SetBackgroundColor( Color(64, 64, 64, 255) );

			local infoRichText = vgui.Create("RichText", infoBackground);
			infoRichText:SetVerticalScrollbarEnabled(false);
			infoRichText:DockMargin(1, 1, 1, 1);
			infoRichText:Dock(FILL);
			self.infoRichText = infoRichText;

			function infoRichText:PerformLayout()
				self:SetBGColor( Color(255, 255, 255) );
			end

   	local textEntry = vgui.Create("DTextEntry", leftDock);
		textEntry:SetMultiline(true);
		textEntry:DockMargin(0, 4, 0, 0);
   	textEntry:Dock(FILL);
		textEntry:SetText(data);

   local rightDock = vgui.Create("Panel", self);
   rightDock:SetSize(width * 0.6, 0);
   rightDock:Dock(RIGHT);

      local buttonRow = vgui.Create("Panel", rightDock);
      buttonRow:SetSize(0, 25);
      buttonRow:DockMargin(0, 4, 0, 0);
      buttonRow:Dock(BOTTOM);

			local btnWidth = (rightDock:GetWide() / 2) - 2;

         local createButton = vgui.Create("DButton", buttonRow);
         createButton:SetText("Add Record");
         createButton:SetSize(btnWidth);
         createButton:Dock(LEFT);
			createButton.DoClick = function()
				if (Schema.dataDraftPanel and Schema.dataDraftPanel:IsValid()) then
					Schema.dataDraftPanel:Close();
					Schema.dataDraftPanel:Remove();
				end;

				Schema.dataDraftPanel = vgui.Create("cwDataDraft");
				Schema.dataDraftPanel:Populate(self);
				Schema.dataDraftPanel:MakePopup();
			end

         local deleteButton = vgui.Create("DButton", buttonRow);
         deleteButton:SetText("Delete Selected");
         deleteButton:SetSize(btnWidth);
         deleteButton:Dock(RIGHT);
			deleteButton.DoClick = function()
				local selectedID = self.listView:GetSelectedLine();

				if selectedID then
					local linePanel = self.listView:GetLine(selectedID);

					if linePanel.dataIndex then
						self.dataPoints[linePanel.dataIndex] = nil;
					end;
				end;

				self:PopulateRecords();
				self:PopulateRichText();
			end

      local listView = vgui.Create("DListView", rightDock);
      listView:SetMultiSelect(false);
      listView:Dock(FILL);
      listView:AddColumn("Reason");
      listView:AddColumn("Added By");
      listView:AddColumn("Point Type");
      listView:AddColumn("Amount");

		self.listView = listView;

	self:PopulateRecords();
	self:PopulateRichText();

	-- A function to set the text entry's real value.
	function textEntry:SetRealValue(text)
		self:SetValue(text);
		self:SetCaretPos( string.len(text) );
	end;

	-- Called each frame.
	function textEntry:Think()
		local text = self:GetValue();

		if (string.len(text) > 1024) then
			self:SetRealValue( string.sub(text, 0, 1024) );

			surface.PlaySound("common/talk.wav");
		end;
	end;

	-- Called when the button is clicked.
	function doneButton.DoClick(button)
		self:Close(); self:Remove();

		if (IsValid(player)) then
			Clockwork.datastream:Start( "EditData", { player, string.sub(textEntry:GetValue(), 0, 1024), self.dataPoints } );
		end;

		gui.EnableScreenClicker(false);
	end;
end;

function PANEL:PopulateRichText()
	local infoRichText = self.infoRichText;

	infoRichText:SetText("");
	infoRichText:InsertColorChange(64, 64, 64, 255);

	infoRichText:AppendText("Name: " .. self.dataName .. "\n");
	infoRichText:AppendText("CID: " .. self.dataCID .. "\n\n");

	local loyaltyPoints = 0;
	local penaltyPoints = 0;

   for i, v in pairs(self.dataPoints) do
      local isLoyal = v.loy;
      local amount = tonumber(v.num) or 0;

		if isLoyal then
			loyaltyPoints = loyaltyPoints + amount;
		else
			penaltyPoints = penaltyPoints + amount;
		end;
   end;

	local totalPoints = loyaltyPoints - penaltyPoints;

	infoRichText:AppendText("Loyalty Points: " .. loyaltyPoints .. "\n");
	infoRichText:AppendText("Penalty Points: " .. penaltyPoints .. "\n\n");
	infoRichText:AppendText("Total Points: " .. totalPoints);
end;

function PANEL:PopulateRecords()
	local listView = self.listView;

	listView:Clear();

   for i, v in pairs(self.dataPoints) do
      local reason = v.rsn or "Unspecified";
      local addedBy = v.usr or "Unknown";
      local isLoyal = v.loy;
      local amount = tonumber(v.num) or 0;

      local pointType = isLoyal and "Loyalty" or "Penalty";

      local linePanel = listView:AddLine(reason, addedBy, pointType, amount);
		linePanel.dataIndex = i;
   end;
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	DFrame.PerformLayout(self);
end;

vgui.Register("cwData", PANEL, "DFrame");
