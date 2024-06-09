/// @description Insert description here
// You can write your code in this editor

max_health *= 1.1;
mp += max_mana / 10;
max_mana *= 1.1;
hp = min(hp + max_health / 5, max_health);
dmg *= 1.5;

instance_destroy(other);