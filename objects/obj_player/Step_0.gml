/// @description Step event
// You can write your code in this editor

// restart when r pressed
if (keyboard_check(ord("R")))
	game_restart();

// key checks
var vel_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var vel_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (sqrt(vel_x*vel_x + vel_y*vel_y) > 0) {
	var alpha = arctan2(vel_y, vel_x);

	vel_x = cos(alpha);
	vel_y = sin(alpha);
	
}

if (keyboard_check_pressed(ord(" "))) {
	var enough_space = true;
	
	switch (formindex) {
		case forms.SMOL:
			enough_space = place_free(x + 8, y);
			enough_space = enough_space ? place_free(x + 8, y + 8) : false;
			enough_space = enough_space ? place_free(x, y + 8) : false;
			enough_space = enough_space ? place_free(x - 8, y + 8) : false;
			enough_space = enough_space ? place_free(x - 8, y) : false;
			break;
		case forms.NORMIE:
			enough_space = place_free(x + 16, y);
			enough_space = enough_space ? place_free(x + 16, y + 16) : false;
			enough_space = enough_space ? place_free(x, y + 16) : false;
			enough_space = enough_space ? place_free(x - 16, y + 16) : false;
			enough_space = enough_space ? place_free(x - 16, y) : false;
			break;
		case forms.CHONK:
			break;
	}
	if (enough_space) {
		formindex++;
		formindex %= 3;
		sprite_index = sprites[formindex];
	}
}

// Had some issues with them being NaN at times
vel_x = ((vel_x == NaN) ? 0 : vel_x);
vel_y = ((vel_y == NaN) ? 0 : vel_y);

// calculate delta x & y
var dx = round(vel_x * x_spd * delta_time / 1000 * 100) / 100;
var dy = round(vel_y * y_spd * delta_time / 1000 * 100) / 100;

// collision

while (!place_free(x, y) && dx ==0 && dy == 0) {
	x--;
}

while (!place_free(x + dx*2, y + dy)) {
	if (!place_free(x + dx*2, y)) {
		dx -= 0.01 * sign(dx);
		show_debug_message("stuck x: {0}", dx);
	}
	
	if (!place_free(x, y + dy)) {
		dy -= 0.01 * sign(dy);
		show_debug_message("stuck y: {0}", dy);
	}
	if (dx == 0 && dy == 0) {
		show_debug_message("exit");
		break;
	}
}


//movement
x += dx*2/(formindex+1);
y += dy/(formindex+1);

depth = 1024 - y;