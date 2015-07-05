//DO YOU DARE TRY AND INTERPRET THIS?

globalvar you;
you = id;
you.spin_me_right_round_baby_right_round = 1;
you.spin_me_right_round_baby_right_round_like_a_record_baby = false;
you.spin_me_right_round_baby_right_round_like_a_record_baby_round_round_round = true;

object_event_add(PlayerControl, ev_step, ev_step_normal , '
    if (keyboard_check_pressed(ord("S")))
        you.spin_me_right_round_baby_right_round_like_a_record_baby = !you.spin_me_right_round_baby_right_round_like_a_record_baby;
    if (you.spin_me_right_round_baby_right_round_like_a_record_baby == true)
    {
        if (you.spin_me_right_round_baby_right_round_like_a_record_baby_round_round_round == true)
        {
            switch (you.spin_me_right_round_baby_right_round)
            {
            case 1:
                window_views_mouse_set(view_wview[0] / 2 + view_xview[0] + 20, mouse_y);
                you.spin_me_right_round_baby_right_round = 0;
                break;
            case 0:
                window_views_mouse_set(view_wview[0]/2 + view_xview[0] - 20, mouse_y);
                you.spin_me_right_round_baby_right_round = 1;
                break;
            }
        }
    }
    if(global.delta_factor != 1)
    {
        you.spin_me_right_round_baby_right_round_like_a_record_baby_round_round_round = !you.spin_me_right_round_baby_right_round_like_a_record_baby_round_round_round;
    }
    else
    {
        you.spin_me_right_round_baby_right_round_like_a_record_baby_round_round_round = true;
    }
');
