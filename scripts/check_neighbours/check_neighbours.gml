/// @function						checks neighbouring nodes
/// @param {Id.DsGrid}	grid		the grid of nodes
/// @param {Struct}		current		the current node
/// @param {Bool}		almost_done	if it's almost done
/// @return {Id.DsList<Struct>}			array of valid neighbouring cells

function check_neighbours(grid, current, almost_done) {
	var neighbours = ds_list_create();
	var n = 0, e = 0, s = 0, w = 0, indices = { "n": -1, "e": -1, "s": -1, "w": -1 };
	if (!(current.x < 5)) {
		n = check_neighbour(grid, neighbours, current, { "x": 0, "y": 1 });
		if (n) {
			show_debug_message("down");
			indices.n = 0;
		}
	}
	if (!(current.y > 9)) {
		e = check_neighbour(grid, neighbours, current, { "x": 1, "y": 0 });
		if (e) {
			show_debug_message("left");
			indices.e = indices.n + 1;
		}
	}
	if (!(current.x > 9)) {
		s = check_neighbour(grid, neighbours, current, { "x": 0, "y": -1 });
		if (s) {
			show_debug_message("up");
			indices.s = (indices.e == -1 ? indices.n + 1 : indices.e + 1);
		}
	}
	if (!(current.y < 5)) {
		w = check_neighbour(grid, neighbours, current, { "x": -1, "y": 0 });
		if (w) {
			show_debug_message("right");
			indices.w = (indices.s == -1 ? (indices.e == -1 ? indices.n + 1 : indices.e + 1) : indices.s + 1);
		}
	}
	show_debug_message(ds_list_size(neighbours));
	if (almost_done && abs(obj_room.start.x - current.x) < 5 && abs(obj_room.start.y - current.y) < 5) {
		show_debug_message("closing in")
		show_debug_message(current);
		show_debug_message(obj_room.start);
		ds_list_destroy(neighbours);
		neighbours = ds_list_create();
		ds_list_add(neighbours, start);
		
		if (obj_room.start.x < current.x) {
			show_debug_message("start on left");
			ds_list_destroy(neighbours);
			neighbours = ds_list_create();
			ds_list_add(neighbours, {"x": current.x - 1, "y": current.y});
		}
		if (obj_room.start.x > current.x) {
			show_debug_message("start on right");
			ds_list_destroy(neighbours);
			neighbours = ds_list_create();
			ds_list_add(neighbours, {"x": current.x + 1, "y": current.y});
		}
		if (obj_room.start.y < current.y) {
			show_debug_message("start up");
			ds_list_destroy(neighbours);
			neighbours = ds_list_create();
			ds_list_add(neighbours, {"x": current.x, "y": current.y - 1});
		}
		if (obj_room.start.y > current.y) {
			show_debug_message("start down");
			ds_list_destroy(neighbours);
			neighbours = ds_list_create();
			ds_list_add(neighbours, {"x": current.x, "y": current.y + 1});
		}
		
	}
	if (almost_done && obj_room.start == current) {
		show_debug_message("done!");
		obj_room.running = false;
		
			
		var temp = ds_grid_create(15, 15);
		ds_grid_copy(temp, obj_room.nodes);
			
		for (var X = 5; X < 10; X++) {
			for (var Y = 5; Y < 10; Y++) {
				ds_grid_set(obj_room.nodes, X, Y, 1);
			}
		}
			
		for (var Y = 0; Y < 15; Y++) {
			var inside = false;
			var last = 0;
			for (var X = 0; X < 15; X++) {
				var cur = ds_grid_get(temp, X, Y);
				var tempstack = ds_stack_create();
				var templist = ds_list_create();
				ds_stack_copy(tempstack, obj_room.stack);
				var index = 0;
				var val = 0;
				for (var i = 0; i < ds_stack_size(obj_room.stack); i++) {
					ds_list_add(templist, ds_stack_pop(tempstack));
				}
				ds_stack_destroy(tempstack);
				index = ds_list_size(templist) - 1 - ds_list_find_index(templist, {"x": X, "y": Y});
				show_debug_message(obj_room.connections[# 0, 0]);
				inside = (cur == 0 ? (last == 0 ? ds_grid_get(obj_room.connections, 3, index-1 >= 0 ? index-1 : 0) == ds_grid_get(obj_room.connections, 1, index-1 >= 0 ? index-1 : 0) - 1 || ds_grid_get(obj_room.connections, 3, (index < ds_grid_height(obj_room.connections) ? index : index -1)) == ds_grid_get(obj_room.connections, 1, (index < ds_grid_height(obj_room.connections) ? index : index -1)) - 1 : !inside) : inside);
				ds_grid_set(temp, X, Y, ds_grid_get(temp, X, Y) == false ? false : !inside);
				last = cur;
			}
		}
		ds_grid_copy(obj_room.nodes, temp);
		ds_grid_destroy(temp);
		show_debug_message("actually done!");
	}
	return neighbours;
}