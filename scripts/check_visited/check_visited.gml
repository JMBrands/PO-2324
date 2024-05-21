// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_visited(value) {
	return ds_list_find_index(obj_room.visited, value) >= 0;
}