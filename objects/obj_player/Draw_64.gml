/// @description Insert description here
// You can write your code in this editor

draw_text(10, 10, string("{0}, {1}", x, y));
draw_text(500, 10, irandom(100));
draw_text(10, 50, int64((1000000/delta_time)));

draw_set_alpha(0.3);
mp_grid_draw(global.grid);
draw_set_alpha(1);
draw_path(obj_blub.path, obj_blub.x, obj_blub.y, 0);
