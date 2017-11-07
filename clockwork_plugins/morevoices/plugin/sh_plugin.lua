/*--------------------------------------------------------------------------\
| THIS ENTIRE PLUGIN IS CREATED BY VIOMI                                    |
| PLEASE DO NOT COPY OR SELL ANY CODE IN HERE WITHOUT PERMISSION FROM VIOMI |
| Contact: satanviomi@gmail.com                                             |
\--------------------------------------------------------------------------*/

local PLUGIN = PLUGIN;

// How to add voices for dispatch:
Schema.voices:AddDispatch("example", "Attention Ground Units. This is an example.", "npc/overwatch/cityvoice/f_anticitizenreport_spkr.wav");

// How to add other faction voices:
Schema.voices:Add("Combine", "combineexample", "This is an example of a combine voice command.", "npc/metropolice/hiding02.wav");

// Faction, Command, Phrase, Sound, Female-Sound, Menu (Unsure what menu is for.)
Schema.voices:Add("Citizen", "Civil Protection", "Civil Protection!", "sound/citizen/blahcivilprotection.mp3", "sound/citizen/blahcivilprotectionfemale.mp3");