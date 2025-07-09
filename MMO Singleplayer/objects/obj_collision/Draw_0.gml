if (global.show_collisions) {
	for(var _i = 0; _i < array_length(collision_points); _i++) {
		draw_circle(collision_points[_i][0], collision_points[_i][1], 4, false);
		if (_i < (array_length(collision_points) - 1)) {
			draw_line(collision_points[_i][0], collision_points[_i][1], collision_points[_i + 1][0], collision_points[_i + 1][1]);
		}
	}
}