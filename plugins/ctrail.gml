object_event_add(PlayerControl,ev_create,0,'
    len = 10;
');

object_event_add(PlayerControl,ev_draw,0,"
    if !variable_local_exists('old_pos') {
        a = 0
        while a < len {
            old_pos[a,0] = mouse_x;
            old_pos[a,1] = mouse_y;  
            a += 1;
        }
    }
    a = len-1
    while a > 0 {
        old_pos[a,0] = old_pos[a-1,0]
        old_pos[a,1] = old_pos[a-1,1]        
        a -= 1
    }      
    
    color = c_blue;
     
    old_pos[0,0] = mouse_x
    old_pos[0,1] = mouse_y   
        a = 0
        while a < len-1 {
            draw_set_alpha(0.2)
            draw_line_width_color(old_pos[a,0], old_pos[a,1]-2, old_pos[a+1,0], old_pos[a+1,1]-2, 1,color,color);
            draw_set_alpha(0.4)
            draw_line_width_color(old_pos[a,0], old_pos[a,1]-1, old_pos[a+1,0], old_pos[a+1,1]-1, 1,color,color);
            draw_set_alpha(0.6)
            draw_line_width_color(old_pos[a,0], old_pos[a,1]-0, old_pos[a+1,0], old_pos[a+1,1]-0, 1,color,color);
            draw_line_width_color(old_pos[a,0], old_pos[a,1]+1, old_pos[a+1,0], old_pos[a+1,1] +1, 1,color,color);
            draw_set_alpha(0.4)
            draw_line_width_color(old_pos[a,0], old_pos[a,1]+2, old_pos[a+1,0], old_pos[a+1,1] +2, 1,color,color);
            draw_set_alpha(0.2)
            draw_line_width_color(old_pos[a,0], old_pos[a,1]+3, old_pos[a+1,0], old_pos[a+1,1] +3, 1,color,color);
        a += 1;
    }   
");

