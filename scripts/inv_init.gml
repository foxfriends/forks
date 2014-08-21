/* Script: inv_init();
Creates the item database, containing all of the items, their buy/sell values,
a description, and the maximum quantity.
Also creates the inventory, storing the item index and the owned quantity.
*/
curItem = 0;
//Make the grids global so that they can be used again later. Also declare the variable for the shop grid
itemDB = ds_grid_create(0,0);  //Create the database
//Add new items to the item database
inv_item(   "Key fork",
            "It looks like a fork, but its actually a key.",
            sKeyFork);
inv_item(   "Plastic Fork",
            "A wimpy fork that will break if used too forcefully. You might as well use your hands.",
            sForkPlastic);
inv_item(   "Steel Fork",
            "The same kind of fork you have at home. It's not the pointiest fork ever, but it will have to do.",
            sForkSteel);
inv_item(   "Silver Fork",
            "A fancy fork made of silver. Hopefully they won't mind it getting damaged.",
            sForkSilver);
inv_item(   "Gold Fork",
            "Conveniently, it is made of some special gold so that its not so soft.",
            sForkGold);
inv_item(   "Platinum Fork",
            "A fork made of a rare and valuable metal. It must have been really expensive.",
            sForkPlatinum);
//Add more for more items... Don't forget to raise the width of the grid if you go over
var invWidth, invHeight;
invWidth = 10;
invHeight = 2;      //Number of values for each item - name and qty
inv = ds_grid_create(invWidth, invHeight);    //Create the inventory      
//Set the inventory to be empty
ds_grid_set_region(InventoryController.inv, 0, ITEMINDEX, ds_grid_width(InventoryController.inv) - 1, ITEMINDEX, -1);       
ds_grid_set_region(InventoryController.inv, 0, ITEMQTY, ds_grid_width(InventoryController.inv) - 1, ITEMQTY, 0); 
//Set the initial amount of money
score = 30;
