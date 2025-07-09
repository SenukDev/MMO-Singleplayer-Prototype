image_speed = 0;

array_push(global.collision_lines, [x - 18, y - 4, x + 3, y]);
array_push(global.collision_lines, [x + 3, y, x + 18, y - 4]);
array_push(global.collision_lines, [x + 18, y - 4, x + 14, y - 16]);
array_push(global.collision_lines, [x + 14, y - 16, x - 14, y - 16]);
array_push(global.collision_lines, [x - 14, y - 16, x - 18, y - 4]);