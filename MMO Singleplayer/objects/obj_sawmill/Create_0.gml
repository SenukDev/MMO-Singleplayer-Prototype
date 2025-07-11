//Parent Inheritance
event_inherited()

//Sawmill Specific Variables
interaction_radius = 40;
interaction_offset_y = -14;

image_speed = 0;

progress = 0
progress_max = 10

//Collision Box
array_push(global.collision_lines, [x - 8, y, x - 28, y - 12]);
array_push(global.collision_lines, [x - 28, y - 12, x - 27, y - 26]);
array_push(global.collision_lines, [x - 27, y - 26, x + 6, y - 46]);
array_push(global.collision_lines, [x + 6, y - 46, x + 26, y - 35]);
array_push(global.collision_lines, [x + 26, y - 35, x + 26, y - 24]);
array_push(global.collision_lines, [x + 26, y - 24, x - 8, y, x - 28]);