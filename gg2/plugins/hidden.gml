//0.001 because 0 -> instance destroy

//particles defeat the purpose of hidden
object_event_add(PlayerControl, ev_step, ev_step_normal, "
    if (global.particles != PARTICLES_OFF)
        global.particles = PARTICLES_OFF;
");

object_event_add(Rocket, ev_step, ev_step_normal,"
    if (image_alpha > 0.1)
        image_alpha -= 0.1;
    if (image_alpha == 0.1)
        image_alpha = 0.001;
");
object_event_add(Shot, ev_step, ev_step_normal,"
    if (image_alpha > 0.1)
        image_alpha -= 0.1;
    if (image_alpha == 0.1)
        image_alpha = 0.001;
");
object_event_add(Bubble, ev_step, ev_step_normal,"
    if (image_alpha > 0.1)
        image_alpha -= 0.1;
    if (image_alpha == 0.1)
        image_alpha = 0.001;
");
object_event_add(BladeB, ev_step, ev_step_normal,"
    if (image_alpha > 0.1)
        image_alpha -= 0.1;
    if (image_alpha == 0.1)
        image_alpha = 0.001;
");
object_event_add(BurningProjectile, ev_step, ev_step_normal,"
    if (image_alpha > 0.1)
        image_alpha -= 0.1;
    if (image_alpha == 0.1)
        image_alpha = 0.001;
");
object_event_add(Mine, ev_step, ev_step_normal,"
    if (image_alpha > 0.1)
        image_alpha -= 0.1;
    if (image_alpha == 0.1)
        image_alpha = 0.001;
    if (speed == 0)
        image_alpha = 0.001;
");
object_event_add(Needle, ev_step, ev_step_normal,"
    if (image_alpha > 0.1)
        image_alpha -= 0.1;
    if (image_alpha == 0.1)
        image_alpha = 0.001;
");