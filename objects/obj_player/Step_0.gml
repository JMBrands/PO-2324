/// @description Step event
// You can write your code in this editor

// restart when r pressed
if (keyboard_check(ord("R")))
	game_restart();

// key checks
var vel_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var vel_y = keyboard_check(ord("W")) - keyboard_check(ord("S"));



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
var dx = vel_x * x_spd * delta_time / 1000;
var dy = vel_y * y_spd * delta_time / 1000;

// collision
while (!place_free(x + (dx + dy)*2, y + dx - dy)) { 
	dx -= 0.01 * sign(dx); // won't do anything if dx or dy is 0 because of sign()
	dy -= 0.01 * sign(dy); 
}

//isometric movement
x += (dy + dx)*2/(formindex+1);
y += (dx - dy)/(formindex+1);
