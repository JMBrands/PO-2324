// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_confirm(){
	return keyboard_check(ord(" ")) ||
		   keyboard_check(ord("Z")) ||
		   keyboard_check(vk_return);
}