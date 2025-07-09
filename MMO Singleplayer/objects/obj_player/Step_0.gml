if (mouse_check_button_pressed(mb_left)) {
	move_target_x = mouse_x;
	move_target_y = mouse_y;
	move_input_type = "target";
	move_input_type_timer = 0;
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

//Calculating Current State
if (point_distance(x, y, move_target_x, move_target_y) > 0) {
	state = "move";
}
else {
	state = "idle";
}

//State
switch(state) {
	case "idle":
		sprite_index = spr_player_idle;
		image_speed = 0;
		image_index = floor((facing_direction + 45) / 90);
		image_xscale = 1;
		
		move_target_x = x;
		move_target_y = y;
		
		velocity_x = 0;
		velocity_y = 0;
		break;
	case "move":
		sprite_index = spr_player_move;
		image_speed = 0.6;
		
		var _direction = point_direction(x, y, move_target_x, move_target_y);
		var _distance = point_distance(x, y, move_target_x, move_target_y);
		
		if sign(lengthdir_x(move_speed, _direction)) != 0 {
			image_xscale = sign(lengthdir_x(move_speed, _direction));
		}
		
		if _distance >= move_speed {
			velocity_x = lengthdir_x(move_speed, _direction);
			velocity_y = lengthdir_y(move_speed, _direction);
			facing_direction = _direction;
		}
		else {
			velocity_x = lengthdir_x(_distance, _direction);
			velocity_y = lengthdir_y(_distance, _direction);
			image_index = 0;
		}
		
		//Collision
		var _result_velocity = collision_slide_velocity(x, y + collision_offset_y, collision_radius, velocity_x, velocity_y);

		velocity_x = _result_velocity.velocity_x;
		velocity_y = _result_velocity.velocity_y;
		
		if (velocity_x == 0 && velocity_y == 0) {
			move_target_x = x;
			move_target_y = y;
		}
		break;
	default:
		break;
}

x += velocity_x;
y += velocity_y;