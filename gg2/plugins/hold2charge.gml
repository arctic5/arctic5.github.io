object_event_add(PlayerControl,ev_step,ev_step_normal,"
    if(global.myself.class == CLASS_SNIPER)
    {
        if(mouse_check_button_released(mb_right))
        {
            mouse_clear(mb_right)
            write_ubyte(global.serverSocket, TOGGLE_ZOOM);
        }
    }
");