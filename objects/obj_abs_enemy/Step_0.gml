/// @description Insert description here
// You can write your code in this editor

var colline = collision_line(x, y, obj_player.x, obj_player.y, obj_grid_wall, true, true);
if (seen > 0 || colline == noone) { // go straight to player when in direct line of sight
	mp_potential_step(obj_player.x, obj_player.y, spd * delta_time / 1000, false);
} else { // random walking
	// mp_potential_step(x + random_range(-100, 100), y + random_range(-100, 100), 0.08 * delta_time / 1000 / 4, false);
}

if (colline == noone) {
	seen = 120;
}

if (seen > 0) {
	seen--;
}

depth = 1024 - y;

if (hp <= 0) {
	instance_destroy();
}