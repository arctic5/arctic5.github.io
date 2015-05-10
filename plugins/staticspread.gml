ini_open("gg2.ini");
global.spreadDebug = ini_read_real("Plugins", "BulletSpreadDebug", 0);
global.spread = max(1, min(65535, ini_read_real("Plugins", "BulletSpread", 3)));
//old default 65535
//changed default value to 3 for minimal configuration
ini_write_real("Plugins", "BulletSpread", global.spread);
ini_write_real("Plugins", "BulletSpreadDebug", global.spreadDebug);
ini_close();

//override spread value if debug is enabled
if (global.spreadDebug == 1) {
    global.spread = 1;
}
object_event_clear(Shotgun,ev_other,ev_user1);
object_event_add(Shotgun,ev_other,ev_user1,'
//do each check one by one because apparently its more efficient that way
    if(global.isHost)
    {
        if(readyToShoot)
        {
            if(ammoCount > 0)
            {
                var seed;
                seed = global.spread;
                sendEventFireWeapon(ownerPlayer, seed);
                doEventFireWeapon(ownerPlayer, seed);
                global.spread += 1;
            }
        }
    }
');

object_event_clear(Scattergun,ev_other,ev_user1);
object_event_add(Scattergun,ev_other,ev_user1,'
    if(global.isHost)
    {
        if(readyToShoot)
        {
            if(ammoCount > 0)
            {
                var seed;
                seed = global.spread;
                sendEventFireWeapon(ownerPlayer, seed);
                doEventFireWeapon(ownerPlayer, seed);
                global.spread += 1;
            }
        }
    }
');
object_set_visible(PlayerControl, true);
object_event_add(PlayerControl,ev_draw,0,"
    if(global.isHost)
    {
        if (global.spreadDebug == 1)
        {
            draw_set_color(c_white)
            draw_text(view_xview[0]+10, view_yview[0]+20,global.spread);
        }
    }
");
