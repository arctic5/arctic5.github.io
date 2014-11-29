var sprite, object;
sprite = sprite_add("Plugins/inverted/inverted.png", 0, false, false, 0, 0);
object = object_add();
object_set_sprite(object, sprite);
object_set_persistent(object, true);
object_set_depth(object, -10000000000);
object_event_add(object, ev_draw, 0, '
    draw_set_blend_mode_ext(bm_inv_dest_color, bm_inv_src_alpha);
    draw_set_color(c_white);
    draw_sprite(sprite_index, image_index, view_xview[0], view_yview[0]);
    draw_set_blend_mode_ext(bm_src_alpha, bm_inv_src_alpha);
')
instance_create(0, 0, object);