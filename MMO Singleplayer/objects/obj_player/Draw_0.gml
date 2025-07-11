//Drawing Move Target
if (state = "move" && (point_distance(x, y, move_target_x, move_target_y) > 0.5)) {
	if (move_input_type = "target") {
		draw_sprite(spr_target, 0, move_target_x, move_target_y);
	}
	else if (move_input_type = "direction") {
		var _direction = point_direction(x, y, move_target_x, move_target_y);
		var _x_offset = 0;
		var _x_radius = 16;
		var _y_offset = -8;
		var _y_radius = 16;
		
		draw_sprite_ext(spr_pointer, 0, x + _x_offset + lengthdir_x(_x_radius, _direction), y + _y_offset + lengthdir_y(_y_radius, _direction), 1, 1, _direction, c_white, 1);
	}
}

//Drawing Player
draw_self();

if (state == "interact") {
	
	var _tool_colour = c_black;
	switch(tool_axe) {
		case TOOLS.AXE_0:
			_tool_colour = c_black;
			break;
		case TOOLS.AXE_1:
			_tool_colour = make_color_rgb(20, 57, 119);
			break;
		case TOOLS.AXE_2:
			_tool_colour = make_color_rgb(255, 215, 0);
			break;
	}
	
	switch(sprite_index) {
		case spr_player_interact_right:
			draw_sprite_ext(spr_player_interact_tool_right, image_index, x, y, image_xscale, image_yscale, image_angle, _tool_colour, 1);
			break;
		case spr_player_interact_left:
			draw_sprite_ext(spr_player_interact_tool_left, image_index, x, y, image_xscale, image_yscale, image_angle, _tool_colour, 1);
			break;
		case spr_player_interact_down:
			draw_sprite_ext(spr_player_interact_tool_down, image_index, x, y, image_xscale, image_yscale, image_angle, _tool_colour, 1);
			break;
		case spr_player_interact_up:
			draw_sprite_ext(spr_player_interact_tool_up, image_index, x, y, image_xscale, image_yscale, image_angle, _tool_colour, 1);
			break;
	}
	draw_set_color(c_white);
}

if (reveal != TOOLS.NOTHING && state == "idle") {
	draw_sprite(spr_tools, reveal, x, y - 52);
}

//Drawing Collision Box
if (global.debug) {
	draw_circle(x, y, 2, false);
	draw_circle(x, y + collision_offset_y, collision_radius, true);
}

draw_set_font(fnt_nunito_12);

//Drawing Current Tool
draw_text(4, 10, "Tool:");
draw_sprite(spr_tools, tool_axe, 58, 20);

//Drawing Inventory
for(var _i = 0; _i < array_length(inventory); _i ++) {
	draw_sprite(spr_inventory, _i, 20, 20 + 34 + (32 + 2) * _i);
	draw_text(40, 10 + 34 + (32 + 2) * _i, string(inventory[_i]));
}