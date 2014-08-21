/* Script: player_move()
Move the player according to arrow keys/WASD.
Includes collisions with _wall
*/
if(!Controller.paused && !Controller.timeline_running) {
    if(knock != 0) {
        hspeed = knock;
        vspeed = 0;
        knock -= min(abs(knock), 1/2) * sign(knock);
        hspeed = floor(hspeed);
        while(place_meeting(x + hspeed, y, _wall) && hspeed != 0) {
            hspeed -= min(abs(hspeed), 1) * sign(hspeed);
        }
        if(hspeed == 0) knock = 0;
        var frame = 4;
        image_index = frame;
        image_speed = 0;
        attacking = false;
    } else {
        var spd = 12, runMult = 1;
        hspeed = (check_input(vk_right) - check_input(vk_left)) * spd * runMult;
        while(place_meeting(x + hspeed, y, _wall) && hspeed != 0) {
            hspeed -= sign(hspeed);
        }
        vspeed = (check_input(vk_down) - check_input(vk_up)) * (spd / 2) * runMult;
        while(place_meeting(x + hspeed, y + vspeed, _wall) && vspeed != 0) {
            vspeed -= sign(vspeed);
        }
        
        if(check_input(vk_control) && instance_exists(_enemy)) {
            blocking = true;
            if(check_input(vk_right)) {
                image_xscale = 1;
            } else if(check_input(vk_left)) {
                image_xscale = -1;
            }
            attacking = false;
        } else {
            blocking = false;
        } 
        if(check_input_pressed(vk_space) && !attacking && !blocking) {
            attacking = 7;
        }
        if(attacking || blocking) {
            hspeed = 0;
            vspeed = 0;
        }
        //Animation
        var idle = 0;
        var moveStart = 1, moveLen = 2;
        var attackFrame = 3, blockFrame = 4;
        if(hspeed != 0 || vspeed != 0) {
            image_xscale = sign(check_input(vk_right) * 2 - check_input(vk_left));
            if(image_xscale == 0) {
                image_xscale = sign(vspeed);
            }
            image_speed = 8 / room_speed;
            if(image_index >= moveStart + moveLen || image_index < moveStart) {
                image_index = moveStart;
            }
        } else if(blocking) {
            image_index = blockFrame;
            image_speed = 0;
        } else if(attacking) {
            if(attacking > 2) {
                image_index = attackFrame;
            } else {
                image_index = idle;
            }
            image_speed = 0;
            attacking--;
        } else {
            image_index = idle;
            image_speed = 0;
        }
    }
} else {
    hspeed = 0;
    vspeed = 0;
    knock = 0;
    image_speed = 0;
}
