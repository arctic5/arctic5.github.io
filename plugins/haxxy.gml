//ARCTICS POST-HAXXY SORE LOSER PLUGIN 
//MAKES YOU FEEL SPECIAL ON THE INSIDE BY GIVING YOU HAXXIES THAT ONLY YOU CAN SEE 
//AND THAT ONLY APPLY TO YOU (and people who actually have haxxies of course)
//BOOSTS SELF CONFIDENCE BY 500%
//now uh is there a less retarded looking way to write this?

ini_open("gg2.ini");
global.psuedohaxxy = ini_read_real("Plugins", "Haxxies", 1);
ini_write_real("Plugins", "Haxxies", global.psuedohaxxy);
ini_close();


object_event_add(HostOptionsController,ev_create,0,'
    //shitty_workarounds 
    _plugins = "Plugins";
    _haxxies = "Haxxies";
    _freehaxxies = "Free haxxies:";
    _psuedohaxxy = "global.psuedohaxxy"

    menu_addedit_boolean(_freehaxxies, _psuedohaxxy, "
        gg2_write_ini(_plugins, _haxxies, argument0);
    ");
'); 

object_event_add(Character,ev_create,0,'
    sendEventUpdateRewards(global.myself, "BHSc:GWSc:GS:BHPy:GWPy:BHSo:GWSo:BHHe:GWHe:BHMe:GWMe:BHDe:GWDe:BHEn:GWEn:BHSp:GWSp:BHSn:GWSn:");
    doEventUpdateRewards(global.myself, "BHSc:GWSc:GS:BHPy:GWPy:BHSo:GWSo:BHHe:GWHe:BHMe:GWMe:BHDe:GWDe:BHEn:GWEn:BHSp:GWSp:BHSn:GWSn:");

    if(global.isHost and global.psuedohaxxy == 1)
    {
        sendEventUpdateRewards(Player, "BHSc:GWSc:GS:BHPy:GWPy:BHSo:GWSo:BHHe:GWHe:BHMe:GWMe:BHDe:GWDe:BHEn:GWEn:BHSp:GWSp:BHSn:GWSn:");
        doEventUpdateRewards(Player, "BHSc:GWSc:GS:BHPy:GWPy:BHSo:GWSo:BHHe:GWHe:BHMe:GWMe:BHDe:GWDe:BHEn:GWEn:BHSp:GWSp:BHSn:GWSn:");
    }
'); 