global.spam = 0;
global.spam2 = 0;
object_event_add(PlayerControl,ev_step,ev_step_begin,"
    if instance_exists(InGameMenuController) 
    || instance_exists(OptionsController) 
    || instance_exists(ControlsController) 
    || instance_exists(HUDOptionsController) exit;
    if instance_exists(TeamSelectController) || instance_exists(ClassSelectController) exit;
    if global.myself.object != -1 {
        if (keyboard_check_pressed(ord('Q'))) {
            global.spam = 1
            if global.spam == 1 {
                write_ubyte(global.serverSocket, CHAT_BUBBLE);
                write_ubyte(global.serverSocket, irandom(46));
            }
            
        }
        // if (keyboard_check_pressed(ord('P'))) {
            // global.spam2 = 1
            // if global.spam2 == 1 {
                    newName = string(irandom(10));
                    write_ubyte(global.serverSocket, PLAYER_CHANGENAME);
                    write_ubyte(global.serverSocket, string_length(newName));
                    write_string(global.serverSocket, newName);
                    socket_send(global.serverSocket);
            // }
            
        }
	}
");
