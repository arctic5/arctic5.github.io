object_event_add(ControlPoint, ev_step, ev_step_end, "
    if global.isHost 
    {
        if capping >= capTime
        {
            if instance_exists(ControlPointHUD) 
            {
                if ControlPointHUD.mode == 1 
                {
                    ControlPointHUD.timer -= 3600;
                }
            }
            GameServer.syncTimer = 1; 
        }
    }
");
object_event_add(ControlPointHUD, ev_create, 0, "
    if (mode == 1)
    {
        global.setupTimer=90;
        timeLimit = 3*30*60;
        GameServer.syncTimer = 1; 
    }
");

object_event_add(ControlPointHUD, ev_step, ev_step_end, "
    // prevent timer overflow
    // credits go to nagn
    // limit time to 5 minute as heenok suggests
    if (timer > 9000)
    {
        timer = 9000;
        GameServer.syncTimer = 1;
    }
");