ini_open("gg2.ini");
global.instakill = ini_read_real("Plugins", "Instakill", false);
ini_write_real("Plugins", "Instakill", global.instakill);
ini_close();

object_event_add(HostOptionsController, ev_create, 0, '
    pluginsStr = "Plugins";
    instakillStr = "Instakill";

    menu_addedit_boolean("Instakill:", "global.instakill", "
        gg2_write_ini(pluginsStr, instakillStr, argument0);
    ");
');

object_event_add(Character,ev_step,ev_step_normal,'
    if (global.instakill) {
        if (lastDamageDealer != noone and timeUnscathed <= 1) {
            hp = 0;
        }
    }
');

object_event_add(Sentry,ev_step,ev_step_normal,'
    if (global.instakill) {
        if (lastDamageDealer != noone) {
            hp = 0;
        }
    }
');