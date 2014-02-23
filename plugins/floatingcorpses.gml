//floating corpses
//by arctic
object_event_clear(DeadGuy,ev_step,ev_step_normal);
object_event_add(DeadGuy,ev_step,ev_step_normal,"
    if(abs(hspeed)<0.2) {
        hspeed=0;
    }   
    if(place_free(x,y+1)) {
        vspeed -= 0.6;
        if(vspeed>10) {
            vspeed=10;
        }
    } else {
        hspeed/=1.1;
    }
");