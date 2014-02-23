global.last_time = current_time;
global.current_fps = 30;
object_event_add(PlayerControl,ev_step,ev_step_begin,"
var time_delta; 
time_delta = (current_time-global.last_time)/1000;
    global.last_time = current_time;
        if time_delta != 0
        {
            global.current_fps = 1/time_delta;
        }
        else
        {
            global.current_fps = 1;
        }
");
object_event_add(Rocket,ev_step,ev_step_normal,"    
    speed *= (30/global.current_fps)
");
object_event_add(Rocket,ev_step,ev_step_end,"   
    speed /= (30/global.current_fps)
");
object_event_add(Shot,ev_step,ev_step_normal,"  
    speed *= (30/global.current_fps)
");
object_event_add(Shot,ev_step,ev_step_end," 
    speed /= (30/global.current_fps)
");
object_event_add(Mine,ev_step,ev_step_normal,"  
    speed *= (30/global.current_fps)
");
object_event_add(Mine,ev_step,ev_step_end," 
    speed /= (30/global.current_fps)
");
object_event_add(Needle,ev_step,ev_step_normal,"  
    speed *= (30/global.current_fps)
");
object_event_add(Needle,ev_step,ev_step_end," 
    speed /= (30/global.current_fps)
");
object_event_add(BurningProjectile,ev_step,ev_step_normal,"  
    speed *= (30/global.current_fps)
");
object_event_add(BurningProjectile,ev_step,ev_step_end," 
    speed /= (30/global.current_fps)
");
object_event_add(Blade,ev_step,ev_step_normal,"  
    speed *= (30/global.current_fps)
");
object_event_add(Blade,ev_step,ev_step_end," 
    speed /= (30/global.current_fps)
");