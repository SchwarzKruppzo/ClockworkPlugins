local PLUGIN = PLUGIN;

Clockwork.option:SetKey("default_date", {month = , year = , day = }); -- sets the default date of which your server is based
Clockwork.option:SetKey("default_time", {minute = , hour = , day = }); -- sets the default time in your server and how many days IC'ly
Clockwork.option:SetKey("model_shipment", ""); -- sets the shipment model (the crate model)
Clockwork.option:SetKey("intro_image", ""); -- sets the menu picture/logo (hl2 rp)
Clockwork.option:SetKey("schema_logo", ""); -- sets the menu picture/logo (hl2 rp)
Clockwork.option:SetKey("menu_music", ""); -- sets the music in your intro menu/character selection menu.
Clockwork.option:SetKey("name_cash", ""); -- sets the name of your currency
Clockwork.option:SetKey("model_cash", ""); -- sets the world and inventory model of your currency 

-- with the menu_music, intro_image and schema_logo, do not put the main directory after the Garrysmod directory
-- in the line. For instance in my FTP when I load it I see the garrysmod directory, you don't need that in the line,
-- then inside you have the materials, models, sound, maps directories, you name it, YOU DO NOT NEED TO ADD THOSE
-- EITHER. menu_music grabs files from the sound folder, image and logo from the materials folder. If you place a
-- sound say in the sound folder, named "IamSound.mp3", then the key would be: "menu_music", "IamSound.mp3". No need
-- to add "sound/IamSound.mp3". You will need a fastDl or worhshop file for any file you add, images in materials 
-- are automatically fastDL as your webhost if you own a dedicated server, should already grab it. 