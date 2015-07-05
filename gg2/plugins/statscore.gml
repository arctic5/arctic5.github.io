object_event_add(ScoreTableController, ev_draw, 0, '
    var xoffset, yoffset, xsize, redteam, blueteam, player, nameBkp;
    
    xoffset = view_xview[0]+view_wview[0]/2-280;
    yoffset = view_yview[0]+view_hview[0]/2-190;
    xsize = 800/5*3;
    redteam = ds_priority_create();
    blueteam = ds_priority_create();

    for(i=0; i<ds_list_size(global.players); i+=1)
    {
        player = ds_list_find_value(global.players, i);
        
        if(player.team == TEAM_RED)
        {
            ds_priority_add(redteam, player, player.stats[POINTS]);
        }
        else if (player.team == TEAM_BLUE)
        {
            ds_priority_add(blueteam, player, player.stats[POINTS]);
        }
    }

    draw_set_color(c_red);   
    for(i=0; ds_priority_size(redteam) > 0; i += 1) {
        player = ds_priority_delete_max(redteam);
        if (i<12)
        {
            draw_set_halign(fa_right);
            var poffset, koffset, aoffset; 
            poffset = string_length(string(floor(player.stats[POINTS]))) * 5;
            koffset = string_length(string(player.stats[KILLS])) * 5;
            aoffset = string_length(string(player.stats[ASSISTS])) * 5;
            player.name = string_copy(player.name, 0, 17 - aoffset/5 + 1 - poffset/5 + 1 - koffset/5 + 1);
            
            draw_text(xoffset+xsize/2-15 - 30 - aoffset - poffset - koffset, yoffset+70+20*(i+1), string(floor(player.stats[CAPS])));
            draw_text(xoffset+xsize/2-15 - 20 - koffset - poffset, yoffset+70+20*(i+1), string(floor(player.stats[ASSISTS])));
            draw_text(xoffset+xsize/2-15 - 10 - poffset, yoffset+70+20*(i+1), string(floor(player.stats[KILLS])));
        }
    }

    draw_set_color(c_blue);
    for(i=0; ds_priority_size(blueteam) > 0; i+=1) {
        player = ds_priority_delete_max(blueteam);
        if i<12
        {
            draw_set_halign(fa_right);
            var poffset, koffset, aoffset; 
            poffset = string_length(string(floor(player.stats[POINTS]))) * 5;
            koffset = string_length(string(player.stats[KILLS])) * 5;
            aoffset = string_length(string(player.stats[ASSISTS])) * 5;
            player.name = string_copy(player.name, 0, 17 - aoffset/5 + 1 - poffset/5 + 1 - koffset/5 + 1);
            
            draw_text(xoffset+xsize+25 - 30 - aoffset - poffset - koffset, yoffset+70+20*(i+1), string(floor(player.stats[CAPS])));
            draw_text(xoffset+xsize+25 - 20 - koffset - poffset, yoffset+70+20*(i+1), string(floor(player.stats[ASSISTS])));
            draw_text(xoffset+xsize+25 - 10 - poffset, yoffset+70+20*(i+1), string(floor(player.stats[KILLS])));
        }
    }
    ds_priority_destroy(redteam);
    ds_priority_destroy(blueteam);
');
