if (selectable && interacted) {
	var _random_chopdown = irandom_range(0, 4);
	
	if (_random_chopdown == 0) {
		inventory_add(INVENTORY_ITEMS.LOG, 3 * obj_player.tool_axe_multiplier)
		selectable = false;
	}
	else {
		var _random_gain_log = irandom_range(0, 2);
		if (_random_gain_log == 0) {
			inventory_add(INVENTORY_ITEMS.LOG, 1 * obj_player.tool_axe_multiplier)
		}
	}
	
	interacted = false;
}

image_index  = (selectable - 1) * -1;

if (selectable == false && timer <= timer_max) {
	timer ++;
}
else {
	selectable = true;
	timer = 0;
}