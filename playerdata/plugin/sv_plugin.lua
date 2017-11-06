Clockwork.datastream:Hook("PlayerData", function(player, data)
	if (type( data[2] ) == "string") then
		data[1]:SetData( "playerdata", string.sub(data[2], 0, 500) );
		
		player.editDataAuthorised = nil;
	end;
end);

--! CAX 5

local name = "Player Data"
local authors = "<font color='gold'>Tru</font>"
function PCheckNotify(msg)
 print("[PChecker] "..msg.."\n")
end
function PCheckError(msg)
 ErrorNoHalt("[PChecker] "..msg.."\n")
end
function PLUGIN:ClockworkSchemaLoaded()
 local plugin = Clockwork.plugin.stored[name];
 
 if (!plugin or plugin.name != name or plugin.author != authors) then
 PCheckError(name.."'s plugin.ini file has been modified!");
 
 if (!Clockwork.plugin:IsDisabled(plugin.name) and plugin) then
 Clockwork.plugin:SetUnloaded(plugin.name, true);
 PCheckError(name.." has been disabled and will not be loaded!")
else
 PCheckError(name.. " cannot be disabled! Consider re-downloading the plugin from http://github.com/trurascalz.")
 end
 
 elseif (!Clockwork.plugin:IsDisabled(plugin.name)) then
 PCheckNotify(name.." has been loaded successfully.")
 end;
end;