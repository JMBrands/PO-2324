/// @description Insert description here
// You can write your code in this editor

if (selected == noone) {
	selected = selectables[0];
} else {
	selected = selectables[(array_get_index(selectables, selected) + 1) % array_length(selectables)];
}
