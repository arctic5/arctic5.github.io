// *one of the* thing*s* that hippie wants
// because bored

// blah blah blah
object_event_add(PlayerControl, ev_create, 0, '
    if (global.isHost)
    {
        global.classlimits[CLASS_SCOUT] = 0;
        global.classlimits[CLASS_PYRO] = 0;
        global.classlimits[CLASS_SOLDIER] = 0;
        global.classlimits[CLASS_HEAVY] = 0;
        global.classlimits[CLASS_DEMOMAN] = 0;
        global.classlimits[CLASS_MEDIC] = 0;
        global.classlimits[CLASS_ENGINEER] = 0;
        global.classlimits[CLASS_SPY] = 255;
        global.classlimits[CLASS_SNIPER] = 0;
        global.classlimits[CLASS_QUOTE] = 0;
    }
');
global.dealDamageFunction += '
    if (global.isHost)
    {
        argument1.hp = -1;
        if (argument0.object != -1)
            argument0.object.currentWeapon.ammoCount = 1;
    }
';
// I don't know how to get around this bug so just make scout a useless piece of shit
// also because wareya and ajf don't want to fix it
// best case scenario isthe doesn't happen at all but this is a failsafe just in case
object_event_add(Scattergun, ev_create, 0, '
    if (global.isHost)
    {
        maxAmmo = 0;
        ammoCount = 0;
    }
');
object_event_add(Scout, ev_create, 0, '
    if (global.isHost)
    {
        runPower = 0;
        maxHp = 1;
    }
');

object_event_add(Revolver, ev_create, 0, '
    if (global.isHost)
    {
        maxAmmo = 0;
        ammoCount = 1;
    }
');

//stolen from lergin
object_event_add(Character,ev_step,ev_step_normal,"
    if (global.isHost)
    {
        if instance_exists(player)
        {
            if (player.class=CLASS_SPY and currentWeapon.ammoCount != 0)
            {
                cloakAlpha = 1;
                cloak = false;
            }
        }
    }
");
