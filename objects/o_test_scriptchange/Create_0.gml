/// @description Insert description here
// You can write your code in this editor

game_set_speed(60, gamespeed_fps);
global.JTT_DEBUGGING = true;
global.JTT_DEFAULT_TYPING_CHIRP = snd_textbox_default;
//global.JTT_DEFAULT_TYPING_TIME = 6;
//global.JTT_DEFAULT_TYPING_TIME_PAUSE = 0;
//global.JTT_DEFAULT_TYPING_TIME_STOP = 0;
script_text = jtt_create_box_scrolling(300, 300, "<alpha:0.5>The quick brown fox jumps over the lazy dog.");
script_text.set_text_align_h(fa_left);
