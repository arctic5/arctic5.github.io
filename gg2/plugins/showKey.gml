global.keysObject = object_add();
object_set_persistent(global.keysObject, true);
object_event_add(global.keysObject,ev_draw,0,"
    with(Character)
    {
        if (player == global.myself)
        {
            c_whatblue = make_color_rgb(0,123,127);
            var xr, yr,;
            xr = round(x);
            yr = round(y);
            draw_set_alpha(1);
            draw_set_halign(fa_center);
            draw_set_valign(fa_bottom);
            draw_set_color(c_whatblue);
            if (keyboard_check(global.jump))
                draw_text_transformed(xr,yr-70,'UP',1.5,1.5,0);
            if (keyboard_check(global.left))
                draw_text_transformed(xr-70,yr,'LEFT',1.5,1.5,0);
            if (keyboard_check(global.right))
                draw_text_transformed(xr+70,yr,'RIGHT',1.5,1.5,0);
        }
    }
");
instance_create(x,y,global.keysObject);
