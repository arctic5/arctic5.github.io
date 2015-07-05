for (x = 0; sprite_exists(x); x += 1)
{
    if file_exists("Plugins/Sprites/mech/" + sprite_get_name(x) + ".gmspr")
    {
        bboxleft = sprite_get_bbox_left(x);
        bboxright = sprite_get_bbox_right(x);
        bboxtop = sprite_get_bbox_top(x);
        bboxbottom = sprite_get_bbox_bottom(x);
        sprite_replace_sprite(x,"Plugins/Sprites/mech/" + sprite_get_name(x) + ".gmspr");
        sprite_collision_mask(x,0,2,bboxleft,bboxtop,bboxright,bboxbottom,1,0);
    }
}
// hacks to make these work

// 2frame,gml
object_event_add(Character,0,0,'sprite_special = 1');

// ofc these guys have to be annoying
blank = sprite_add('',0,0,0,0,0);
sprite_assign(RifleFS,RifleS);
sprite_assign(RifleFRS,RifleS);
sprite_assign(FlamethrowerDropS,FlamethrowerS);
sprite_assign(FlamethrowerBlastS,FlamethrowerS);
sprite_assign(SniperCrouchRedS,SniperRedS);
sprite_assign(SniperCrouchBlueS,SniperBlueS);
sprite_assign(SniperCrouchBlueS,SniperBlueS);
//OMG THANKS WAREYA
sprite_assign(BackstabLegsS, pointS);


object_event_add(Weapon, ev_step, ev_step_end, '
    recoilSprite = normalSprite
    recoilImageSpeed = 0;
    blastImageSpeed = 0;
    dropImageSpeed = 0;
    if (justShot)
    {
        justShot = false;
        //Recoil Animation
        if (sprite_index != recoilSprite)
        {
            sprite_index = recoilSprite;
            if (ownerPlayer.team = TEAM_RED)
                image_index = 2;
            else
                image_index = 1;
            
            image_speed = recoilImageSpeed * global.delta_factor;
        }
        alarm[6] = recoilTime / global.delta_factor;
    }
');
object_event_add(Flamethrower, ev_step, ev_step_end, '
    if (justBlast)
    {
        justBlast = false;
        //Airblast Recoil Animation
        sprite_index = blastSprite;
        if (ownerPlayer.team = TEAM_RED)
            image_index = 2;
        else
            image_index = 3;
        image_speed = 2;
        alarm[7] = blastNoFlameTime / global.delta_factor;
        alarm[6] = 0;
    }
');