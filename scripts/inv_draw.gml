/* Script: inv_draw();
Draws every item in the inventory in a grid. 
*/
var slot, boxX = 16, boxY = window_get_height() - ITEMH - 16;
//Use the custom font for writing
draw_set_font(fDialog);
draw_set_color(c_white);
for(slot = 0; slot < ds_grid_width(inv); slot += 1) {
    //Check to see that there are still items in the inventory
    //Check if the current item is the selected item and highlight it
    //Draw the item
    if(inv_read(slot, ITEMQTY) > 0) {
        //Draw the sprite
        if(instance_exists(Player)) {
            if(Player.currentFork == slot) {
                draw_set_alpha(0.2);
                draw_rectangle(boxX, boxY, boxX + ITEMW, boxY + ITEMH, true);
                draw_set_alpha(1);
            }
        }
        draw_sprite(inv_itemdb(inv_read(slot, ITEMINDEX), ITEMSPRITE), 0, boxX, boxY);
    }
    //Increment positions
    boxX += ITEMW;
}
draw_set_color(c_white);
slot = -1;
if(mouse_x > view_xview[0] + 16 && mouse_y > view_yview[0] + view_hview[0] - ITEMH - 16 && mouse_y < view_yview[0] + view_hview[0] - 16) {
    slot = (mouse_x - view_xview[0] - 16) div ITEMW;
}
if(slot > ds_grid_width(inv) || slot == -1) {
    if(instance_exists(Player)) {
        slot = Player.currentFork;
    } else {
        slot = -1;
    }
}
if(slot != -1) {
    if(inv_read(slot, ITEMQTY) > 0) {
        draw_set_valign(fa_bottom);
        draw_text(16, window_get_height() - ITEMH - 16 - 4, inv_itemdb(inv_read(slot, ITEMINDEX), ITEMNAME) + ": " + inv_itemdb(inv_read(slot, ITEMINDEX), ITEMDESC));
        draw_set_valign(fa_top);
    }
}
draw_set_color(c_black);
