/* Script: view_resize();
Resizes the view and port to fill the screen.
If the room is smaller than the screen, it centers
the view on the middle of the room.
*/
view_enabled = true;
view_visible[0] = true;
view_wview[0] = 960;
view_hview[0] = 800;
view_wport[0] = 960;
view_hport[0] = 800;
if(instance_exists(Player)) {
    view_object[0] = Player;
    view_hspeed[0] = -1;
    view_hborder[0] = room_width;
    view_vspeed[0] = -1;
    view_vborder[0] = room_height;
}
window_set_size(view_wport[0], view_hport[0]);
window_set_position((display_get_width() - view_wport[0]) / 2,
                    (display_get_height() - view_hport[0]) / 2);
