/// @description Insert description here
// You can write your code in this editor
randomize();

floor_type=irandom(2);

x = 512;
y = 512;

xoff = 32;
yoff = 16;
for (var tx = -2; tx <= 2; tx++) {
	for (var ty = -2; ty <= 2; ty++) {
		instance_create_depth(x+tx*xoff-2*(ty*yoff), y+ty*yoff+(tx*xoff)/2, 1024-(y+ty*yoff), obj_floor, {"image_index": floor_type})
	}
}

sides = irandom(15);

nodes = ds_grid_create(15, 15);
ds_grid_set_region(nodes, 0,0, 14,14, 1);
ds_grid_set_region(nodes, 5,5, 9,9, 0);

running = true;
start = {"x": irandom(4), "y": irandom(4)};
cur = start;
connections = ds_grid_create(4,1);
visited = ds_list_create();
stack = ds_stack_create();
its = 0;

while (running) {
	ds_stack_push(stack, cur);
	ds_grid_set(nodes, cur.x, cur.y, 0);
	ds_list_add(visited, cur);
	
	var neighbours = check_neighbours(nodes, cur, (its > 20));
	
	if (!running)
		break;
	
	if (ds_list_size(neighbours) < 1) {
		ds_grid_set(nodes, cur.x, cur.y, 1);
		ds_stack_pop(stack);
		var tempcur = ds_stack_pop(stack);
		cur = tempcur == undefined ? cur : tempcur;
		ds_grid_set(nodes, cur.x, cur.y, 1);
		ds_grid_resize(connections, 4, ds_grid_height((connections) -1));
	} else {
		var next = ds_list_find_value(neighbours, irandom(ds_list_size(neighbours)-1));
		connections[# 0, ds_grid_height(connections) -1] = cur.x;
		connections[# 1, ds_grid_height(connections) -1] = cur.y;
		connections[# 2, ds_grid_height(connections) -1] = next.x;
		connections[# 3, ds_grid_height(connections) -1] = next.y;
		ds_grid_resize(connections, 4, ds_grid_height(connections) + 1);
		cur = next;
		if (ds_grid_height(connections) > 20)
			ds_grid_set(nodes, start.x, start.y, 1);
	}
	
	its++;
}

for (var tx = 0; tx < 15; tx++) {
	var row = [];
	for (var i = 0; i < 15; i++) {
		row[i] = ds_grid_get(nodes, i, tx);
	}
	show_debug_message("{0}", row)
	for (var ty = 0; ty < 15; ty++) {
		if (!ds_grid_get(nodes, tx, ty)) {
			instance_create_depth((x+(tx-8)*xoff-2*((ty-8)*yoff)), (y+(ty-6)*yoff+((tx-8)*xoff)/2), 150, obj_floor, {"image_index": floor_type});
		}
	}
}