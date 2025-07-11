//Drawing Move Target
if (state = "move" && (point_distance(x, y, move_target_x, move_target_y) > 0.5)) {
	if (move_input_type = "target") {
		draw_sprite(spr_target, 0, move_target_x, move_target_y);
	}
	else if (move_input_type = "direction") {
		var _direction = point_direction(x, y, move_target_x, move_target_y);
		var _x_offset = 0;
		var _x_radius = 16;
		var _y_offset = -8//-24;
		var _y_radius = 16;
		
		draw_sprite_ext(spr_pointer, 0, x + _x_offset + lengthdir_x(_x_radius, _direction), y + _y_offset + lengthdir_y(_y_radius, _direction), 1, 1, _direction, c_white, 1);
	}
}

//Drawing Player
draw_self();

//Drawing Collision Box
if (global.debug) {
	draw_circle(x, y, 2, false);
	draw_circle(x, y + collision_offset_y, collision_radius, true);
}


//Drawing Inventory
draw_set_font(fnt_nunito_12);

for(var _i = 0; _i < array_length(inventory); _i ++) {
	draw_sprite(spr_inventory, _i, 20, 20 + (32 + 2) * _i)
	draw_text(40, 10 + (32 + 2) * _i, string(inventory[_i]));
}