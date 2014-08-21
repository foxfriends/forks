/* Script: inv_item(name, description, sprite)
argument0 -> The name of the item               (string)
argument1 -> A description of the item          (string)
argument2 -> The class of the item              (string)
argument3 -> The maximum quantity of the item   (real: -1 for unlimited)
argument4 -> A sprite of the object             (real: sprite index)
Adds a new item to the item database. Returns true if all values are correct,
false otherwise. If the database is too small, it will make it bigger
*/
var name, description, sprite, index;
name = argument0;
description = argument1;
sprite = argument2;
//If there are empty spaces left in the item database...
if(ds_grid_value_exists(itemDB, 0, ITEMNAME, ds_grid_width(itemDB) - 1, ITEMNAME, "")) {
    //... the index is the first empty space
    index = ds_grid_value_x(itemDB, 0, ITEMNAME, ds_grid_width(itemDB) - 1, ITEMNAME, "");
} else {
    //... set the index to the width and make it bigger
    index = ds_grid_width(itemDB);
    ds_grid_resize(itemDB, index + 1, 3);
}
//check to make sure all the given values are correct
if(is_string(name) && is_string(description) && sprite_exists(sprite)) {
    //If they are, then insert them into the database
    ds_grid_set(itemDB, index, ITEMNAME, name);
    ds_grid_set(itemDB, index, ITEMDESC, description);
    ds_grid_set(itemDB, index, ITEMSPRITE, sprite);
    return true;
} else return false;
