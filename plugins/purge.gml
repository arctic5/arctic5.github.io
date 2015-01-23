sound_delete(DeathSnd3);
sound_delete(DeathSnd4);
sound_delete(DeathSnd5);
sound_delete(DeathSnd6);
object_event_add(PlayerControl, ev_create, 0, "
    // so the parser doesnt spit out an error when it still assumes
    // the sounds still exist
    execute_string('
        DeathSnd3 = DeathSnd1;
        DeathSnd4 = DeathSnd1;
        DeathSnd5 = DeathSnd2;
        DeathSnd6 = DeathSnd2;
    ');
");
instance_destroy();
