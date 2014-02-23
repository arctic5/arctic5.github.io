object_event_add(PlayerControl,ev_step,ev_step_begin,"
    if instance_exists(InGameMenuController) 
    || instance_exists(OptionsController) 
    || instance_exists(ControlsController) 
    || instance_exists(HUDOptionsController) exit;
    if instance_exists(TeamSelectController) || instance_exists(ClassSelectController) exit;
    if global.myself.object != -1 {
        if (keyboard_check_pressed(ord('Q'))) {
            write_ubyte(global.serverSocket, CHAT_BUBBLE);
            write_ubyte(global.serverSocket, 46);
        }
	}
");