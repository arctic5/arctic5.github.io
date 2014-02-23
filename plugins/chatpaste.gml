object_event_add(global.chatWindow,ev_step,ev_step_end,"
    if keyboard_check_direct(vk_control) { 
        if keyboard_check_pressed(ord('V')) keyboard_string += clipboard_get_text();
    }
");