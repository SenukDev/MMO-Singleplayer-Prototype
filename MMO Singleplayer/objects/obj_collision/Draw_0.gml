if (global.show_collisions) {
	for(var _i = 0; _i < array_length(global.collision_lines); _i++) {
		draw_circle(global.collision_lines[_i][0], global.collision_lines[_i][1], 2, false);
		draw_circle(global.collision_lines[_i][2], global.collision_lines[_i][3], 2, false);
		draw_line(global.collision_lines[_i][0], global.collision_lines[_i][1], global.collision_lines[_i][2], global.collision_lines[_i][3]);
	}
	
	if (creating_line) {
		draw_circle(first_point_x, first_point_y, 2, false);
		draw_circle(mouse_x, mouse_y, 2, false);
		draw_line(first_point_x, first_point_y, mouse_x, mouse_y);
	}
}