object_event_add(Character,ev_collision,Character,'
    if (moveStatus == 1)
    {
        if (y > other.y)
            exit;
        if(other.team != team and other.ubered == 0)
        {
            source = round(random(27));
            vspeed = 0;
            other.lastDamageDealer = player;
            other.hp = 0;
            other.lastDamageSource = source;
        }
    }
');
