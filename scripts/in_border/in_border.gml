// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function in_border(value){
	var i = 0;
	repeat (ds_list_size(obj_room.connections)) {
		var val = ds_list_find_value(obj_room.connections, i);
		if (val[0] == value)
			return true;
		i++;
	}
	return false;
}