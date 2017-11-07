local Clockwork = Clockwork;

Clockwork.censor = Clockwork.kernel:NewLibrary("Censor");
Clockwork.censor.stored = {};

-- A function to censor a word.
function Clockwork.censor:Add(text, replace)
	self.stored[#self.stored + 1] = {
		text = text,
		replace = replace
	};
end;

--[[--------------------------------------------------------
	Please note that this plugin uses Regular Expressions
	http://www.regular-expressions.info/reference.html
--------------------------------------------------------]]--

Clockwork.censor:Add("nigger", "raccoon");
Clockwork.censor:Add("faggot", "flamingo");
Clockwork.censor:Add("wetback", "reindeer");
Clockwork.censor:Add("cunt", "cheetah");
Clockwork.censor:Add("niglet", "pelican");
Clockwork.censor:Add("chink", "dolphin");