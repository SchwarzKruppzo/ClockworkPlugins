local PLUGIN = PLUGIN;

PLUGIN.chargesData = {
   {"npc/overwatch/radiovoice/disturbancemental10-103m.wav", "10-103m, disturbance by mentally unfit"},
   {"npc/overwatch/radiovoice/fugitive17f.wav", "17F, fugitive detachment"},
   {"npc/overwatch/radiovoice/attemptedcrime27.wav", "27, attempted crime"},
   {"npc/overwatch/radiovoice/nonsanctionedarson51.wav", "51, non-sanctioned arson"},
   {"npc/overwatch/radiovoice/threattoproperty51b.wav", "51B, threat to property"},
   {"npc/overwatch/radiovoice/alarms62.wav", "62, alarms"},
   {"npc/overwatch/radiovoice/criminaltrespass63.wav", "63, criminal trespass"},
   {"npc/overwatch/radiovoice/posession69.wav", "69, posession of resources"},
   {"npc/overwatch/radiovoice/illegalcarrying95.wav", "95, illegal carrying"},
   {"npc/overwatch/radiovoice/recklessoperation99.wav", "99, reckless operation"},
   {"npc/overwatch/radiovoice/resistingpacification148.wav", "148, resisting arrest"},
   {"npc/overwatch/radiovoice/assault243.wav", "243, assault on protection team"},
   {"npc/overwatch/radiovoice/riot404.wav", "404, riot"},
   {"npc/overwatch/radiovoice/disturbingunity415.wav", "415, civic disunity"},
   {"npc/overwatch/radiovoice/publicnoncompliance507.wav", "507, public non-compliance"},
   {"npc/overwatch/radiovoice/unlawfulentry603.wav", "603, unlawful entry"},
   {"npc/overwatch/radiovoice/capitalmalcompliance.wav", "Capital malcompliance"},
   {"npc/overwatch/radiovoice/disassociationfromcivic.wav", "Disassociation from the civic populous"},
   {"npc/overwatch/radiovoice/failuretocomply.wav", "Failure to comply with the civil will"},
   {"npc/overwatch/radiovoice/incitingpopucide.wav", "Divisive sociocidal counter-obeyance"},
   {"npc/overwatch/radiovoice/level5anticivilactivity.wav", "Level five anti-civil activity"},
   {"npc/overwatch/radiovoice/promotingcommunalunrest.wav", "Promoting communal unrest"},
   {"npc/overwatch/radiovoice/violationofcivictrust.wav", "Violation of civic trust"}
};

Clockwork.kernel:IncludePrefixed("sv_plugin.lua");
Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
