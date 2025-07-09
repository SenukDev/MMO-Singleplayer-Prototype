function collision_slide_velocity(_position_x, _position_y, _collision_radius, _velocity_x, _velocity_y) {
	//Starting Velocity
	var _result_velocity_x = _velocity_x;
	var _result_velocity_y = _velocity_y;
	
	//Loop Variables
	var _max_iterations = 3;
	var _collided = false;
	
	for (var _i = 0; _i < _max_iterations; _i ++) {
		//Predicted Position based on Current Velocity
		var _predicted_x = _position_x + _result_velocity_x;
		var _predicted_y = _position_y + _result_velocity_y;
		
		_collided = false;
		
		for (var _j = 0; _j < array_length(global.collision_lines); _j++) {
			//Get the Collision Line
			var _x1 = global.collision_lines[_j][0];
			var _y1 = global.collision_lines[_j][1];
			var _x2 = global.collision_lines[_j][2];
			var _y2 = global.collision_lines[_j][3];
			
			
			// Bounding box check
			var _min_x = min(_x1, _x2) - _collision_radius;
			var _max_x = max(_x1, _x2) + _collision_radius;
			var _min_y = min(_y1, _y2) - _collision_radius;
			var _max_y = max(_y1, _y2) + _collision_radius;
			if (_predicted_x < _min_x || _predicted_x > _max_x || _predicted_y < _min_y || _predicted_y > _max_y) {
			    continue;
			}
			
			//Check if line length is 0 because we are dividing by it in the next step
			var _dx = _x2 - _x1;
	        var _dy = _y2 - _y1;
	        var _line_length_squared = _dx * _dx + _dy * _dy;
	        if (_line_length_squared == 0) {
				continue;
			}
			
			// Find the closest point on line to the prediction
	        var _t = clamp(((_predicted_x - _x1) * _dx + (_predicted_y - _y1) * _dy) / _line_length_squared, 0, 1);
			
	        var _closest_x = _x1 + _t * _dx;
	        var _closest_y = _y1 + _t * _dy;

	        var _distance_x = _predicted_x - _closest_x;
	        var _distance_y = _predicted_y - _closest_y;
	        var _distance_squared = _distance_x * _distance_x + _distance_y * _distance_y;
			
			//Check for collision
			if (_distance_squared < (_collision_radius * _collision_radius)) {
				_collided = true;
				
				//Calculate how far the prediction is past the collision line
	            var _distance = sqrt(_distance_squared);
	            var _penetration = _collision_radius - _distance;

	            // Normal direction of the collision line
	            var _nx = _distance != 0 ? _distance_x / _distance : 0;
	            var _ny = _distance != 0 ? _distance_y / _distance : 0;

	            // Push out of the surface
	            _result_velocity_x += _nx * _penetration;
	            _result_velocity_y += _ny * _penetration;

	            // Remove velocity into normal for sliding
	            var _dot = _result_velocity_x * _nx + _result_velocity_y * _ny;
	            if (_dot < 0) {
	                _result_velocity_x -= _nx * _dot;
	                _result_velocity_y -= _ny * _dot;
	            }

	            // Break early to recheck from start (after applying correction)
	            break;
	        }
		}
		
		// Exit the loop if no collision is found in this iteration
		if (!_collided) break;
	}
	
	//If after multiple iterations there is still a collision or the velocity is really small, then return 0 velocity
	if (_collided || (abs(_result_velocity_x) <= 0.1 && abs(_result_velocity_y) <= 0.1)) {
		_result_velocity_x = 0;
		_result_velocity_y = 0;
	}
	
	var _result = {
		velocity_x : _result_velocity_x,
		velocity_y : _result_velocity_y
	}
	
	return _result
}