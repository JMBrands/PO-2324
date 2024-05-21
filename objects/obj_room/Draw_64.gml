/// @description Insert description here
// You can write your code in this editor
for (var X = 0; X < 15; X++) {
	for (var Y = 0; Y < 15; Y++) {
		if (ds_grid_get(nodes, X, Y)) {
			draw_rectangle(X*15, Y*15, X*15+5, Y*15+5, 2);
		}
	}
}