/// @description Step event
// You can write your code in this editor

// restart when r pressed
if (keyboard_check(ord("R")))
	game_restart();
	
if (hp <= 0) {
	game_end(0);
}

// key checks
var vel_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var vel_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var key_chonk = keyboard_check_pressed(ord("1"));
var key_normie = keyboard_check_pressed(ord("2"));
var key_smol = keyboard_check_pressed(ord("3"));
var key_form_cycle = keyboard_check_pressed(ord("F"));
var skill_1 = keyboard_check(ord(" "));

if (vel_x < 0) {
	if (vel_y < 0) {
		facing = facings.NORTHWEST;
	} else if (vel_y > 0) {
		facing = facings.SOUTHWEST;
	} else if (facing == facings.SOUTHEAST) {
		facing = facings.SOUTHWEST;
	} else if (facing == facings.NORTHEAST) {
		facing = facings.NORTHWEST;
	}
} else if (vel_x > 0) {
	if (vel_y < 0) {
		facing = facings.NORTHEAST;
	} else if (vel_y > 0) {
		facing = facings.SOUTHEAST;
	} else if (facing == facings.SOUTHWEST) {
		facing = facings.SOUTHEAST;
	} else if (facing == facings.NORTHWEST) {
		facing = facings.NORTHEAST;
	}	
}

// movement normalization
if (sqrt(vel_x*vel_x + vel_y*vel_y) > 0) {
	var alpha = arctan2(vel_y, vel_x);

	vel_x = cos(alpha);
	vel_y = sin(alpha);
	movement_angle = alpha;
}

// skills
if (skill_1) {
	switch (formindex) {
		case forms.SMOL:
			if (mp < 10 || skill_cooldown || !place_free(x + (128 * cos(movement_angle)), y + (64 * sin(movement_angle))))
				break;
			x += (128 * cos(movement_angle));
			y += (64 * sin(movement_angle));
			mp -= 10;
			skill_cooldown = true;
			alarm[2] = 15;
			break;
		case forms.NORMIE:
			if (mp < 20 || skill_cooldown)
				break;
			skill_cooldown = true;
			alarm[2] = 45;
			instance_create_depth(x, y, 0, obj_skill_normie);
			mp -= 20;
			break;
		case forms.CHONK:
			if (mp < 10) 
				break;
			var wall;
			switch (facing) {
				case facings.NORTHEAST:
					wall = collision_line(x, y, x + range * 2, y - range, obj_grid_wall, true, true);
					instance_create_depth(x + range * 2, y - range, 0, obj_marker);
					if (wall != noone && !wall.unbreakable) {
						breaktimer++;
						if (breaktimer > 60) {
							instance_destroy(wall);
						}
					} else {
						breaktimer = 0;
					}
					break;
				case facings.SOUTHEAST:
					wall = collision_line(x, y, x + range * 2, y + range, obj_grid_wall, true, true);
					instance_create_depth(x + range * 2, y + range, 0, obj_marker);
					if (wall != noone && !wall.unbreakable) {
						breaktimer++;
						if (breaktimer > 60) {
							instance_destroy(wall);
						}
					} else {
						breaktimer = 0;
					}
					break;
				case facings.SOUTHWEST:
					wall = collision_line(x, y, x - range * 2, y + range, obj_grid_wall, true, true);
					instance_create_depth(x - range * 2, y + range, 0, obj_marker);
					if (wall != noone && !wall.unbreakable) {
						breaktimer++;
						if (breaktimer > 60) {
							instance_destroy(wall);
						}
					} else {
						breaktimer = 0;
					}
					break;
				case facings.NORTHWEST:
					wall = collision_line(x, y, x - range * 2, y - range, obj_grid_wall, true, true);
					instance_create_depth(x - range * 2, y - range, 0, obj_marker);
					if (wall != noone && !wall.unbreakable) {
						breaktimer++;
						if (breaktimer > 60) {
							instance_destroy(wall);
						}
					} else {
						breaktimer = 0;
					}
					break;
			}
			if (breaktimer > 60) {
				mp -= 10;
			}
			break;
	}
} else {
	breaktimer = 0;
}

// movement

if (key_form_cycle) {
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

if (key_chonk) {
	var enough_space = true;
	
	switch (formindex) {
		case forms.SMOL:
			enough_space = place_free(x + 16, y);
			enough_space = enough_space ? place_free(x + 16, y + 16) : false;
			enough_space = enough_space ? place_free(x, y + 16) : false;
			enough_space = enough_space ? place_free(x - 16, y + 16) : false;
			enough_space = enough_space ? place_free(x - 16, y) : false;
			break;
		case forms.NORMIE:
			enough_space = place_free(x + 16, y);
			enough_space = enough_space ? place_free(x + 16, y + 16) : false;
			enough_space = enough_space ? place_free(x, y + 16) : false;
			enough_space = enough_space ? place_free(x - 16, y + 16) : false;
			enough_space = enough_space ? place_free(x - 16, y) : false;
			break;
	}
	if (enough_space) {
		formindex = forms.CHONK;
		sprite_index = sprites[formindex];
	}
}

if (key_normie) {
	var enough_space = true;
	
	if (formindex == forms.SMOL) {
		enough_space = place_free(x + 8, y);
		enough_space = enough_space ? place_free(x + 8, y + 8) : false;
		enough_space = enough_space ? place_free(x, y + 8) : false;
		enough_space = enough_space ? place_free(x - 8, y + 8) : false;
		enough_space = enough_space ? place_free(x - 8, y) : false;
	}
	
	if (enough_space) {
		formindex = forms.NORMIE;
		sprite_index = sprites[formindex];
	}
}

if (key_smol) {
	formindex = forms.SMOL;
	sprite_index = sprites[formindex];
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
x += dx*2/(formindex+1);
y += dy/(formindex+1);

// health interpolation
if (display_hp != hp) {
	if (abs(hp - display_hp) > 0.2) {
		var curdmg = (hp - display_hp) / 10;
		display_hp += curdmg;
	} else {
		display_hp = hp;
	}
}

// mana interpolation
if (display_mp != mp) {
	if (abs(mp - display_mp) > 0.2) {
		var curdmg = (mp - display_mp) / 10;
		display_mp += curdmg;
	} else {
		display_mp = mp;
	}
}

if (mp < max_mana) {
	mp += max_mana/6000;
}

if (place_meeting(x+1,y,obj_abs_enemy) || place_meeting(x-1,y,obj_abs_enemy) || place_meeting(x,y+1,obj_abs_enemy) || place_meeting(x,y-1,obj_abs_enemy)) {
	event_user(0);
}

depth = 1024 - y;