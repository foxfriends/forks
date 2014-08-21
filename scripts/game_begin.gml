/* Script: game_begin();
Starts a new game
*/
Controller.state = GS_BEGIN;
Controller.timeline_index = lIntro;
Controller.timeline_position = 0;
Controller.timeline_running = true;
Controller.paused = false;
room_goto(rStart);
