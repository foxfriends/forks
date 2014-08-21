/* Script: inv_update(index, field, replacement)
argument0 -> The index of the item in the item database to update (Real: between 0 and the width of the item database OR String: the item name)
argument1 -> The field that you want to change 
argument2 -> The new value for the field
Changes the value of the specified item's field to the replacement
value. Returns true on success, and false if the type of the value
does not work with the field, or it just fails.
*/
var index, field, replacement;
index       = argument0;
field       = argument1;
replacement = argument2;
if(is_string(index)) {
    index = ds_grid_value_x(InventoryController.itemDB, 0, ITEMNAME, ds_grid_width(InventoryController.itemDB) - 1, ITEMNAME, index);
}
if(field >= 0 && field <= 1 && is_string(replacement)) {
    ds_grid_set(InventoryController.itemDB, index, field, replacement);
    return true;
} else if(field > 1 && field < 5 && is_real(replacement)) {
    ds_grid_set(InventoryController.itemDB, index, field, replacement);
    return true;
} else return false;
