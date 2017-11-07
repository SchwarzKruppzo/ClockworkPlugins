function cwDiseases:GetProgressBarInfo()
	local action, percentage = Clockwork.player:GetAction(LocalPlayer(), true);

	if (action == "injecting") then
		return {text = "Injecting...", percentage = percentage, flash = percentage < 10};
	end;
end;