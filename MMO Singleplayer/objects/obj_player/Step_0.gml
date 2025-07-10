//Calculating Current State
if (selected_node != noone && instance_exists(selected_node)) {
	var _distance = point_distance(x, y, selected_node.x, selected_node.y + selected_node.interaction_offset_y);
	if (_distance > selected_node.interaction_radius) {
		move_target_x = selected_node.x;
		move_target_y = selected_node.y + selected_node.interaction_offset_y;
		state = "move";
	}
	else {
		if (state != "interact") {
			image_index = 0;
		}
		state = "interact";
	}
}
else if (point_distance(x, y, move_target_x, move_target_y) > 0) {
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
	case "interact":
		image_xscale = 1;
		image_speed = 0.4;
		switch(floor((facing_direction + 45) / 90)) {
			case 0:
				sprite_index = spr_player_interact_right;
				break;
			case 1:
				sprite_index = spr_player_interact_up;
				break;
			case 2:
				sprite_index = spr_player_interact_left;
				break;
			case 3:
				sprite_index = spr_player_interact_down;
				break;
			default:
				sprite_index = spr_player_interact_right;
				break;
		}
		
		if (image_index < 1) {
			interaction_once_per_cycle = false;
		}
		else if (interaction_once_per_cycle == false){
			interaction_once_per_cycle = true;
			selected_node.interacted = true;
		}
		
		if (selected_node.selectable == false && image_index >= 2) {
			selected_node = noone;
		}
		
		move_target_x = x;
		move_target_y = y;
		
		velocity_x = 0;
		velocity_y = 0;
	default:
		break;
}

x += velocity_x;
y += velocity_y;