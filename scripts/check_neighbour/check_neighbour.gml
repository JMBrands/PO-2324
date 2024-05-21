// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_neighbour(grid, neighbours, current, c) {
	if (current.x + c.x >= 0 && current.x + c.x < 15 && current.y + c.y >= 0 && current.y + c.y < 15 &&  ds_grid_get(grid, current.x + c.x, current.y + c.y) && !check_visited({"x": current.x + c.x, "y": current.y + c.y})) {
		ds_list_add(neighbours, {"x": current.x + c.x, "y": current.y + c.y});
		return true;
	}
	return false;
}