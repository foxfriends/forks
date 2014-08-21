/* Script: dialog_input(question, default);
argument0: question     -> The question to ask (String)
argument1: default      -> The default value of the field (String)
Asks the player a question, similar to dialog_question(),
but instead of options gives a box for typing a string into.
*/
//No var - this is an instance variable. It will be needed later
DialogController.questionAsked = argument[0];
if(argument_count == 2) {
    DialogController.inputValue = argument[1];
} else {
    DialogController.inputValue = "";
}
dialog_msg(DialogController.inputValue, DialogController.questionAsked);
