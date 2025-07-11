//Inputs
if (state != "craft") {
	if (mouse_check_button_pressed(mb_left)) {
		move_target_x = mouse_x;
		move_target_y = mouse_y;
		move_input_type = "target";
		move_input_type_timer = 0;
		selected_node = noone
	}

	if (mouse_check_button(mb_left)) {
		var _distance_to_player = point_distance(x,y, mouse_x, mouse_y)
	
		if (_distance_to_player >= (move_speed * 2)) {
			if (move_input_type == "target") {
				if (move_input_type_timer >= move_input_type_timer_threshold) {
					move_input_type = "direction";
				}
				else {
					move_input_type_timer ++;
				}
			}
			else if (move_input_type == "direction") {
				move_target_x = mouse_x;
				move_target_y = mouse_y;
			}
		}
	}

	if (point_distance(x, y, move_target_x, move_target_y) > 0 && move_input_type == "direction") && !mouse_check_button(mb_left) {
		move_input_type_timer = 0;
		move_target_x = x;
		move_target_y = y;
	}
	
	if (keyboard_check_pressed(vk_enter)) {
		craft_item(CRAFTING_TOOLS.AXE_TIER_1);
	}
}