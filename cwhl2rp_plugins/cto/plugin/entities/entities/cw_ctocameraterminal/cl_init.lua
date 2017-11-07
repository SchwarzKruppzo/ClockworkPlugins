include("shared.lua");

function ENT:CreateTexMat()
	cwCTO.terminalMaterialIdx = cwCTO.terminalMaterialIdx + 1;

	self.tex = GetRenderTarget("ctouniquert" .. cwCTO.terminalMaterialIdx, 512, 256, false);
	self.mat = CreateMaterial("ctouniquemat" .. cwCTO.terminalMaterialIdx, "UnlitGeneric", {
		["$basetexture"] = self.tex,
	});
end;

-- Called every frame.
function ENT:Think()
	if (not self.tex or not self.mat) then
		self:CreateTexMat();
	end;

	cwCTO.terminalsToDraw[self] = Clockwork.Client:IsLineOfSightClear(self);
end;

-- Called when the entity should draw.
function ENT:Draw()
	self:DrawModel();
end;
