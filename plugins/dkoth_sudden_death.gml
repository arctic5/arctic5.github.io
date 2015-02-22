// dkoth sudden death
// most code borrowed from tiscoolers dkoth antistall

object_event_add(DKothHUD,ev_create,0,"
    StartValue=8*60*30;
    ReduceBothTimers=StartValue;
    Prompted=0;
");

object_event_add(DKothHUD,ev_step,0,"
    //Run only as host.
    if (global.isHost)
    {
        //If both points are owned by their respective teams for (StartValue) minutes, 
        if (!KothRedControlPoint.locked or !KothBlueControlPoint.locked) 
        {
            if (KothRedControlPoint.team == TEAM_RED && redTimer > 0 && KothBlueControlPoint.team == TEAM_BLUE && blueTimer > 0)
            {
                if (ReduceBothTimers <= 0)
                {
                    if (!Prompted) 
                    {
                        Prompted=1;
                        ServerMessageString('SUDDEN DEATH! Both timers reduced to overtime, cap to win!',global.sendBuffer);
                        with NoticeO instance_destroy();
                        notice = instance_create(0, 0, NoticeO);
                        notice.notice = NOTICE_CUSTOM;
                        notice.message = 'SUDDEN DEATH! Both timers reduced to overtime, cap to win!';
                    }
                    redTimer = 0;
                    blueTimer = 0;
                    GameServer.syncTimer=1;
                }
                else if ReduceBothTimers>0
                    ReduceBothTimers-=1;
            }
            else
            {
                ReduceBothTimers=StartValue;
                Prompted=0;
            }
            if hostTimer<=5 {hostTimer= global.timeLimitMins*30*60;}
        }
    }
");