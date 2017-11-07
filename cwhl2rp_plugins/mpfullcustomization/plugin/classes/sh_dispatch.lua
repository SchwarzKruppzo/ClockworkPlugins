/*----------------------\
| Created by Viomi      |
| viomi@openmailbox.org |
\----------------------*/

local CLASS = Clockwork.class:New("Dispatch")
	CLASS.color = Color(50, 100, 150, 255)
	CLASS.wages = 80
	CLASS.factions = {FACTION_MPF}
	CLASS.wagesName = "Supplies"
	CLASS.description = "Dispatch Unit."
	CLASS.defaultPhysDesc = "Dispatch Unit."
CLASS_AI = CLASS:Register()