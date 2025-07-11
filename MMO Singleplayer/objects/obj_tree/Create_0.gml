//Parent Inheritance
event_inherited()

//Tree Specific Variables
interaction_radius = 26;
interaction_offset_y = -4;

image_speed = 0;

timer = 0;
timer_max = 90;

//Collision Box
array_push(global.collision_lines, [x - 18, y - 4, x + 3, y]);
array_push(global.collision_lines, [x + 3, y, x + 18, y - 4]);
array_push(global.collision_lines, [x + 18, y - 4, x + 14, y - 16]);
array_push(global.collision_lines, [x + 14, y - 16, x + 3, y - 20]);
array_push(global.collision_lines, [x + 3, y - 20, x - 14, y - 16]);
array_push(global.collision_lines, [x - 14, y - 16, x - 18, y - 4]);