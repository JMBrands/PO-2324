/// @description Insert description here
// You can write your code in this editor
randomize();

floor_type=irandom(2);

x = 256;
y = 256;

xoff = 32;
yoff = 16;
for (var tx = -2; tx <= 2; tx++) {
	for (var ty = -2; ty <= 2; ty++) {
		instance_create_depth(x+tx*xoff-2*(ty*yoff), y+ty*yoff+(tx*xoff)/2, 1024-(y+ty*yoff), obj_floor, {"image_index": floor_type})
	}
}

sides = irandom(15);

nodes = ds_grid_create(15, 15);
ds_grid_add_region(nodes, 5,5, 9,9, 0);
ds_grid_add_region(nodes, 0,0, 4,4, 0);
ds_grid_add_region(nodes, 10,0, 14,4, 0);
ds_grid_add_region(nodes, 0,10, 4,14, 0);
ds_grid_add_region(nodes, 10,10, 14,14, 0);

regions = [[[5,0],[9,4]],[[10,5],[14,9]],[[5,10],[9,14]],[[0,5],[4,9]]];

for (var region = 0; region < 4; region++) {
	var reg = regions[region];
	var sx = 0, sy = 0;
	switch (region) {
		case 0:
			sx = 5;
			sy = 4;
			ds_grid_add_region(nodes, sx, sy, sx, irandom_range(sy-4,sy), 1);
			ds_grid_add_region(nodes, sx+1, sy, sx+1, irandom_range(sy-4,sy), 1);
			ds_grid_add_region(nodes, sx+2, sy, sx+2, irandom_range(sy-4,sy), 1);
			ds_grid_add_region(nodes, sx+3, sy, sx+3, irandom_range(sy-4,sy), 1);
			ds_grid_add_region(nodes, sx+4, sy, sx+4, irandom_range(sy-4,sy), 1);
			break;
		case 1:
			sx = 10;
			sy = 5;
			ds_grid_add_region(nodes, sx, sy, irandom_range(sx+4,sx), sy, 1);
			ds_grid_add_region(nodes, sx, sy+1, irandom_range(sx+4,sx), sy+1, 1);
			ds_grid_add_region(nodes, sx, sy+2, irandom_range(sx+4,sx), sy+2, 1);
			ds_grid_add_region(nodes, sx, sy+3, irandom_range(sx+4,sx), sy+3, 1);
			ds_grid_add_region(nodes, sx, sy+4, irandom_range(sx+4,sx), sy+4, 1);
			break;
		case 2:
			sx = 5;
			sy = 10;
			ds_grid_add_region(nodes, sx, sy, sx, irandom_range(sy+4,sy), 1);
			ds_grid_add_region(nodes, sx+1, sy, sx+1, irandom_range(sy+4,sy), 1);
			ds_grid_add_region(nodes, sx+2, sy, sx+2, irandom_range(sy+4,sy), 1);
			ds_grid_add_region(nodes, sx+3, sy, sx+3, irandom_range(sy+4,sy), 1);
			ds_grid_add_region(nodes, sx+4, sy, sx+4, irandom_range(sy+4,sy), 1);
			break;
		case 3:
			sx = 4;
			sy = 5;
			ds_grid_add_region(nodes, sx, sy, irandom_range(sx-4,sx), sy, 1);
			ds_grid_add_region(nodes, sx, sy+1, irandom_range(sx-4,sx), sy+1, 1);
			ds_grid_add_region(nodes, sx, sy+2, irandom_range(sx-4,sx), sy+2, 1);
			ds_grid_add_region(nodes, sx, sy+3, irandom_range(sx-4,sx), sy+3, 1);
			ds_grid_add_region(nodes, sx, sy+4, irandom_range(sx-4,sx), sy+4, 1);
			break;
			
	}
}

for (var tx = 0; tx < 15; tx++) {
	for (var ty = 0; ty < 15; ty++) {
		if (ds_grid_get(nodes, tx, ty)) {
			instance_create_depth((x+(tx-8)*xoff-2*((ty-8)*yoff)), (y+(ty-6)*yoff+((tx-8)*xoff)/2), 150, obj_floor, {"image_index": floor_type});
		}
	}
}