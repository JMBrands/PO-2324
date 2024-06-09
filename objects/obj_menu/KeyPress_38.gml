/// @description Insert description here
// You can write your code in this editor

if (selected == noone) {
	selected = selectables[array_length(selectables) -1];
} else {
	selected = selectables[(array_get_index(selectables, selected) + array_length(selectables) - 1) % array_length(selectables)];
}
audio_play_sound(snd_click, 1, false);