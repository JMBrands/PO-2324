/// @description Insert description here
// You can write your code in this editor
 if (!attack_cooldown) {
	attack_cooldown = true;
	alarm[1] = 30;
	instance_create_depth(x, y, 0, attacks[formindex]);
 }