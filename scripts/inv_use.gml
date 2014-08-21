/* Script: inv_use(item)
argument0: item     -> The slot of the item being used
item = inv_itemdb(inv_read(selectedItem, ITEMINDEX), ITEMNAME);
*/
var removeItem, item = argument0;
removeItem = false;
//Figure out what item is being used
item = argument0;
//Then find it's action and do it
switch(inv_itemdb(inv_read(item, ITEMINDEX), ITEMNAME)) {
    case "Apple":
        //Heal health for food
        health += 10;
        //And you ate the food, so remove it
        removeItem = true;
        break;
    case "Burger":
        health += 30;
        removeItem = true;
        break;
    case "Chocolate":
        health += 15;
        removeItem = true;
        break;
    case "Sword":
        //Change your weapon to the sword
        currentWeapon = "Sword";
        //But you don't eat the sword... so don't remove it
        break;
    default:
        //If you would like, you can put something here to do when the item has no use
        break;
}
//If the item is being used up (such as food)
if(removeItem) {
    //Remove one from it's quantity
    inv_subtract(item, 1);
}
