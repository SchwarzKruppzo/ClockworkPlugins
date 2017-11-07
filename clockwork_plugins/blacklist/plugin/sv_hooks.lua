local PLUGIN = PLUGIN;

function PLUGIN:ClockworkDatabaseConnected()
  print("created??");
	local CREATE_BLACKLIST_TABLE = [[
	CREATE TABLE IF NOT EXISTS `]]..Clockwork.config:Get("mysql_blacklist_table"):Get()..[[` (
	`_Key` int(11) NOT NULL AUTO_INCREMENT,
	`_Identifier` varchar(255) NOT NULL,
	`_SteamName` varchar(255) NOT NULL,
	`_Schema` text NOT NULL,
	`_Blacklists` longtext NOT NULL,
  PRIMARY KEY (`_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;]];
	Clockwork.database:Query(string.gsub(CREATE_BLACKLIST_TABLE, "%s", " "), nil, nil, true);
end;
