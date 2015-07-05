object_event_add(Character,ev_create,0,"
    canDoublejump = true;
");
object_event_add(Character,ev_step,ev_step_begin,"
    doublejumpUsed = false;
");
