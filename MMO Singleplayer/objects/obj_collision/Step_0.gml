if (mouse_check_button_pressed(mb_right)) {
	creating_line = true;
	first_point_x = mouse_x;
	first_point_y = mouse_y;
}

if (creating_line && mouse_check_button_released(mb_right)) {
	creating_line = false;
	if !(first_point_x == mouse_x && first_point_y == mouse_y) {
		array_push(global.collision_lines, [first_point_x, first_point_y, mouse_x, mouse_y]);
	}
}