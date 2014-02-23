//explosive taunt
//by arctic
//makes taunts have a 50% chance of making you explode 

object_event_add(Character,ev_step,ev_step_normal,"
if taunting 
{
    if (tauntindex == 0) or (tauntindex == tauntlength) 
    {
        {
            //flip a coin
            //heads you die
            //tails you live
            coin = ceil(random(2));
            switch(coin)
            {
            case 1: //heads
                lastDamageDealer = other.player;
                lastDamageSource = FINISHED_OFF_GIB;
                hp = 0;
                gibbuffer += 10
                with(DeadGuy)
                    instance_destroy();
                break;
            case 2: //tails
                break;
            }
        }
    }
}
");