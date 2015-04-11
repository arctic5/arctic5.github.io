if !variable_global_exists('chatWindow') global.chatWindow = object_add();

object_event_add(PlayerControl, ev_create, 0, "mykills = global.myself.stats[KILLS];");
object_event_add(PlayerControl, ev_other, ev_room_start, "mykills = global.myself.stats[KILLS];");
object_event_add(PlayerControl, ev_other, ev_room_end, "mykills = 0;");

object_event_add(PlayerControl, ev_step, ev_step_normal, "
    if (global.myself.stats[KILLS] > mykills)
    {
        if (instance_exists(global.chatWindow))
        {
            with (global.chatWindow)
            {
                _message = 'xd';
                _team = global.myself.team;
                event_user(3);
            }
        }
        mykills = global.myself.stats[KILLS];
    }
");
