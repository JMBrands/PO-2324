/// @description Insert description here
// You can write your code in this editor

path = path_add();

if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, true)) {
	path_start(path, 0.2, 3, 0);
}
/*
var vel_x = obj_player.x - x;
var vel_y = obj_player.y - y;


if (sqrt(vel_x*vel_x + vel_y*vel_y) > 0) {
	var alpha = arctan2(vel_y, vel_x);

	vel_x = cos(alpha);
	vel_y = sin(alpha);
	
}

// Had some issues with them being NaN at times
vel_x = ((vel_x == NaN) ? 0 : vel_x);
vel_y = ((vel_y == NaN) ? 0 : vel_y);

// calculate delta x & y
var dx = round(vel_x * x_spd * delta_time / 1000 * 10) / 10;
var dy = round(vel_y * y_spd * delta_time / 1000 * 10) / 10;

// collision

while (!place_free(x, y) && dx ==0 && dy == 0) {
	x--;
}

while (!place_free(x + dx * 2, y) || ! place_free(x, y + dy)) {
	if (dx == 0 && dy == 0)
		break; 
	
	if (!place_free(x + dx*2, y)) {
		if (dx == 0)
			break;
		dx -= 0.1 * sign(dx);
		dx = round(dx * 10) / 10;
	}
	
	if (!place_free(x, y + dy)) {
		if (dy == 0)
			break;
		dy -= 0.1 * sign(dy);
		dy = round(dy * 10) / 10;
	}
}


//movement
x += dx*2;
y += dy;
*/
depth = 1024 - y;

