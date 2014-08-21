/* Script:  dialog_msg(message[, speaker[, sprite1[, sprite2]]])
Required argument:
argument0: message  -> The message to write (string)
Optional arguments, must be in order but they don't all have to be there:
argument1: speaker  -> The speaker's name (string)
argument2: sprite1  -> The sprite to display on the left (sprite index)
argument3: sprite2  -> The sprite to display on the right (sprite index)
Add a new message to the queue. Optionally also specifies
a speaker's name and sprites to show. If the dialog string
is longer than the message box size, it will automatically
insert line breaks, or even split the message into two parts.
Tips:
- The 'COL', 'SIZE', and 'WAIT" characters can NOT be seen in the dialog.
    However, 'SPR' and 'SPKR' characters can.
- Use the 'COL' and 'SIZE' constants, rather than hard coding 
    the symbol, even though its annoying and takes longer.
    This will make it easier if you decide you want to use
    one of the symbols in the actual dialog to change them
    all at once.
    E.G:
    "My favourite fruit is" + COL + "y banana" + COL + "k.";
    Rather than:
    "My favourite fruit is%y banana%k.";
- The 'WAIT' constant is multiplied by 3 automatically. Add more 'WAIT's
    to make the time even longer
- When resizing your text, dialog_wrap does NOT account for the changed size.
    If you make your text bigger, it is good to do the lines manually.
- The constants don't work in the speaker's name
- Use the noone keyword to not draw a sprite
- Use "" as speaker if you want (a) sprite(s) but no name
- The speaker doesn't have to be just names. You can use things like
    "Tip" or "Bob (quietly)" as well. Just don't include the 'SPKR' character.
- Using the OPTION character will prevent string wrapping, so don't use it
*/
var message = argument[0], msgstr = "";
if(argument_count >= 2) { //Speaker
    if(argument_count >= 3) { //Left sprite
        msgstr += string(argument[2]) + SPR;
        if(argument_count >= 4) { //Right sprite
            msgstr += string(argument[3]) + SPR;
        } else {
            msgstr += string(noone) + SPR; //Add noone if there is no argument
        }
    } else {
        //Both are noone if there is no argument
        msgstr += string_repeat(string(noone) + SPR, 2);
    }
    if(argument[1] != "") { //Add speaker after the sprites
        msgstr += argument[1];
    }
}
msgstr += SPKR; //Add SPKR, even if there is no speaker
if(!string_count(OPTION, message)) { //Don't wrap the string if it's a list of options
    message = dialog_wrap(message, DIAWIDTH - (2 * DIAPADH));
}
if(message != "") {
    while(message != "") {
        var substr = "";
        //Split the message into multiple boxes if it's too tall.
        while(string_count("#", substr) < floor((DIAHEIGHT - DIASPKRH - DIAPADV) / string_height("A"))) {
            if(string_count("#", message)) {
                //Move the line to the substr from the original
                substr += string_copy(message, 1, string_pos("#", message));
                message = string_copy(message, string_pos("#", message) + 1, string_length(message));
            } else {
                //No more lines in the message, so add the whole thing
                substr += message;
                message = "";
                break; //Force the loop to end
            }
        }
        //Lengthen the pauses to be 3 `s long
        substr = string_replace_all(substr, WAIT, '```');
        ds_queue_enqueue(DialogController.dialog, msgstr + substr); //Add the part of the message to the queue
        //String in queue looks like: 12@28@Name:Message
    }
} else {
    //Must provide handling for blank messages in case of no default value for dialog_input();
    ds_queue_enqueue(DialogController.dialog, msgstr);
}
