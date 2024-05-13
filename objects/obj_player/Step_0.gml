/// @description Step event
// You can write your code in this editor

// restart when r pressed
if (keyboard_check(ord("R")))
	game_restart();

// key checks
var vel_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var vel_y = keyboard_check(ord("W")) - keyboard_check(ord("S"));

if (keyboard_check_pressed(ord(" "))) {
	formindex++;
	formindex %= 3;
	sprite_index = sprites[formindex];
}

// Had some issues with them being NaN at times
vel_x = ((vel_x == NaN) ? 0 : vel_x);
vel_y = ((vel_y == NaN) ? 0 : vel_y);

// calculate delta x & y
var dx = vel_x * x_spd * delta_time / 1000;
var dy = vel_y * y_spd * delta_time / 1000;

// collision
while (!place_free(x + dx, y)) {
	dx -= 0.001 * sign(dx);
}

while (!place_free(x, y + dy)) {
	dy -= 0.001 * sign(dy);
}

//isometric movement
x += (dy + dx)*2;
y += dx - dy;
