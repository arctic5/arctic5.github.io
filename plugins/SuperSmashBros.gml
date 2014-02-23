//Arctics Super Smash Bros Plugin
//prepare for some shitty object_event_clears and object_event_adds that change only one value
//and make the code much longer than it probably should be

//removing the version check for now

object_event_add(Character,ev_step,ev_step_normal, "
//sorta shitty invincibility code
if (hp < maxHp)
{
    hp = maxHp;
}
//extremely shitty code to make knockback from explosions seem more drastic
//basically makes the person have low gravity when they get shot up
//since I can't get the damn knockback value in the create event to work
if (moveStatus = 1)
    {
        vspeed -= 0.3;
    }
");


//shitty clears start here
object_event_clear(Shot,ev_collision,Character);
object_event_add(Shot,ev_collision,Character,"
if(other.id != ownerPlayer.object and other.team != team && other.hp > 0 && other.ubered == 0) {
        other.hp -= hitDamage;
        other.timeUnscathed = 0;
        if (other.lastDamageDealer != ownerPlayer && other.lastDamageDealer != other.player){
            other.secondToLastDamageDealer = other.lastDamageDealer;
            other.alarm[4] = other.alarm[3]
        }
        other.alarm[3] = ASSIST_TIME;
        other.lastDamageDealer = ownerPlayer;
        other.lastDamageSource = weapon;
        var blood;
        if(global.gibLevel > 0){
            blood = instance_create(x,y,Blood);
            blood.direction = direction-180;
            }
        
        with(other)
        {
            motion_add(other.direction, other.speed*40);
            cloakAlpha = max(cloakAlpha, 0.3);
            cloakFlicker = true;
            alarm[7] = 3;
        }
    instance_destroy();
    }
");

object_event_clear(BladeB,ev_collision,Character);
object_event_add(BladeB,ev_collision,Character,"
{
    if(other.id != ownerPlayer.object and other.team != team) {
        if(!other.ubered)
        {
            other.hp -= hitDamage;
            other.timeUnscathed = 0;
            if (other.lastDamageDealer != ownerPlayer and other.lastDamageDealer != other.player)
            {
                other.secondToLastDamageDealer = other.lastDamageDealer;
                other.alarm[4] = other.alarm[3]
            }
            other.alarm[3] = ASSIST_TIME;
            other.lastDamageDealer = ownerPlayer;
            other.lastDamageSource = weapon;
            var blood;
            if(global.gibLevel > 0){
                repeat(25)
                {
                    blood = instance_create(x,y,Blood);
                    blood.direction = direction-180;
                }
            }
        }
        with(other) {
            motion_add(other.direction, other.speed*30);
            cloakAlpha = max(cloakAlpha, 0.3);
            cloakFlicker = true;
            alarm[7] = 3;
        }
        instance_destroy();
    }
}
");

object_event_clear(Needle,ev_collision,Character);
object_event_add(Needle,ev_collision,Character,"
if(other.id != ownerPlayer.object and other.team != team && other.hp > 0 && other.ubered == 0) {
        other.hp -= hitDamage;
        other.timeUnscathed = 0;
        if (other.lastDamageDealer != ownerPlayer && other.lastDamageDealer != other.player){
            other.secondToLastDamageDealer = other.lastDamageDealer;
            other.alarm[4] = other.alarm[3]
        }
        other.alarm[3] = ASSIST_TIME;
        other.lastDamageDealer = ownerPlayer;
        other.lastDamageSource = weapon;
        var blood;
        if(global.gibLevel > 0){
            blood = instance_create(x,y,Blood);
            blood.direction = direction-180;
            }
    with(other)
    {
        motion_add(other.direction, other.speed*30);
        cloakAlpha = max(cloakAlpha, 0.3);
        cloakFlicker = true;
        alarm[7] = 3;
    }
    instance_destroy();
}
");

object_event_clear(Flamethrower,ev_other,ev_user2);
object_event_add(Flamethrower,ev_other,ev_user2,"
{
    if (readyToBlast && ammoCount >= 40)
    {
        //Base
        playsound(x,y,CompressionBlastSnd);
        poof = instance_create(x+lengthdir_x(25,owner.aimDirection),y+lengthdir_y(25,owner.aimDirection),AirBlastO);
        if image_xscale == 1
        {
            poof.image_xscale = 1;
            poof.image_angle = owner.aimDirection;
        }
        else
        {
            poof.image_xscale = -1;
            poof.image_angle = owner.aimDirection+180;
        }
        poof.owner = owner;
        with(poof)
            motion_add(owner.direction, owner.speed);
        
        var shot;
        //Flare
        if (owner.keyState & $10 and ammoCount >= 75 and readyToFlare)
        {
            if !collision_line(x,y,x+lengthdir_x(28,owner.aimDirection),y+lengthdir_y(28,owner.aimDirection),Obstacle,1,0)
                and !place_meeting(x+lengthdir_x(25,owner.aimDirection),y+lengthdir_y(25,owner.aimDirection),TeamGate)
            {
                shot = instance_create(x+lengthdir_x(25,owner.aimDirection),y+lengthdir_y(25,owner.aimDirection),Flare);
                shot.direction=owner.aimDirection;
                shot.speed=15;
                shot.owner=owner;
                shot.ownerPlayer=ownerPlayer;
                shot.team=owner.team;
                shot.weapon=WEAPON_FLARE;
                
                justShot=true;
                readyToFlare=false;
                ammoCount -= 35;
                alarm[2] = flareReloadTime;
            }
        }
            
        //Reflects
        with(Rocket)
        {
            if(ownerPlayer.team != other.owner.team)
            {
                dir = point_direction(other.x, other.y, x, y);
                dist = point_distance(other.x, other.y, x, y);
                angle = abs((dir-other.owner.aimDirection)+720) mod 360;
                if collision_circle(x,y,5,other.poof,false,true)
                {
                    ownerPlayer = other.ownerPlayer;
                    team = other.owner.team;
                    weapon = WEAPON_REFLECTED_ROCKET;
                    hitDamage = 25;
                    explosionDamage = 30;
                    knockback = 8;
                    alarm[0] = 200;
                    alarm[1] = 40;
                    alarm[2] = 80;
                    motion_set(other.owner.aimDirection, speed);
                }
            }
        }
        with(Flare)
        {
            if(ownerPlayer.team != other.owner.team)
            {
                dir = point_direction(other.x, other.y, x, y);
                dist = point_distance(other.x, other.y, x, y);
                angle = abs((dir-other.owner.aimDirection)+720) mod 360;
                if collision_circle(x,y,5,other.poof,false,true)
                {
                    ownerPlayer = other.ownerPlayer;
                    team = other.owner.team;
                    weapon = WEAPON_REFLECTED_FLARE;
                    alarm[0]=40;
                    
                    motion_set(other.owner.aimDirection, speed);
                }
            }
        }
        
        with(Mine)
        {
            if(ownerPlayer.team != other.owner.team)
            {
                dir = point_direction(other.x, other.y, x, y);
                dist = point_distance(other.x, other.y, x, y);
                angle = abs((dir-other.owner.aimDirection)+720) mod 360;
                if collision_circle(x,y,5,other.poof,false,true)
                {
                    motion_set(other.owner.aimDirection, max(speed, other.blastStrength / 3));
                    reflector = other.ownerPlayer;
                    if (stickied)
                    {
                        var dx, dy, l;
                        speed *= 0.65;
                        dy = (place_meeting(x,y-3,Obstacle) > 0);
                        dy -= (place_meeting(x,y+3,Obstacle) > 0);
                        dx = (place_meeting(x-3,y,Obstacle) > 0);
                        dx -= (place_meeting(x+3,y,Obstacle) > 0);
                        l = sqrt(dx*dx+dy*dy);
                        if(l>0)
                        {
                            var normalspeed;
                            dx /= l;
                            dy /= l;
                            normalspeed = dx*hspeed + dy*vspeed;
                            if(normalspeed < 0)
                            {
                                hspeed -= 2*normalspeed*dx;
                                vspeed -= 2*normalspeed*dy;
                            }
                        }
                        stickied = false;
                    }
                }
            }
        }
        
        //Shoves
        with(Character)
        {
                dir = point_direction(other.x, other.y, x, y);
                dist = point_distance(other.x, other.y, x, y);
                angle = abs((dir-other.owner.aimDirection)+720) mod 360;
                if collision_circle(x,y,25,other.poof,false,true) {
                    if(team != other.owner.team)
                    {
                        motion_add(other.owner.aimDirection, other.characterBlastStrength*50);
                        vspeed -= 2;
                        moveStatus = 3;
                        if (lastDamageDealer != other.ownerPlayer && lastDamageDealer != player)
                        {
                            secondToLastDamageDealer = lastDamageDealer;
                            alarm[4] = alarm[3];
                        }
                        alarm[3] = ASSIST_TIME;
                        lastDamageDealer = other.ownerPlayer;
                        lastDamageSource = -1;
                    }
                    else if (burnIntensity > 0 || burnDuration > 0)
                    {
                        burnIntensity = 0;
                        burnDuration = 0;
                        burnedBy = -1;
                        afterburnSource = -1;
                    }
            }
        }
        
        with(LooseSheet)
        {
            dir = point_direction(other.x, other.y, x, y);
            dist = point_distance(other.x, other.y, x, y);
            angle = abs((dir-other.owner.aimDirection)+720) mod 360;
            if collision_circle(x,y,25,other.poof,false,true)
            {
                motion_add(other.owner.aimDirection, other.blastStrength*(1-dist/other.blastDistance) );
            }
        }
        
        with(Gib)
        {
            dir = point_direction(other.x, other.y, x, y);
            dist = point_distance(other.x, other.y, x, y);
            angle = abs((dir-other.owner.aimDirection)+720) mod 360;
            if collision_circle(x,y,25,other.poof,false,true)
            {
                motion_add(other.owner.aimDirection, other.blastStrength*(1-dist/other.blastDistance) );
            }
        }
        
        //Finish
        justBlast = true;
        readyToBlast=false;
        readyToShoot=false;
        alarm[5]=blastReloadTime;
        isRefilling = false;
        alarm[1]=blastReloadTime;
        alarm[0]=blastNoFlameTime;
        ammoCount -= 40;
    }
}
");