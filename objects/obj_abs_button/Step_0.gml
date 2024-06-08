/// @description Insert description here
// You can write your code in this editor

mouse_hovering =((mouse_x / window_get_width() * display_get_width()) < (x + sprite_width) &&
				 (mouse_x / window_get_width() * display_get_width()) > x &&
				 (mouse_y / window_get_height() * display_get_height()) < (y + sprite_height) &&
				 (mouse_y / window_get_height() * display_get_height()) > y);

if ((mouse_hovering || obj_menu.selected == object_index) && x != active_x) {
	x += (active_x - x) / 5;
} else if (!mouse_hovering && obj_menu.selected != object_index && x != default_x) {
	x += (default_x - x) / 5;
}

if (mouse_hovering) {
	obj_menu.selected = noone;
}

if ((obj_menu.selected == object_index && check_confirm()) || (mouse_hovering && mouse_check_button_pressed(mb_left))) {
	event_user(0);
}