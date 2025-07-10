image_index  = (selectable - 1) * -1;

if (selectable && interacted) {
	var _random = irandom_range(0,4)
	
	if (_random == 0) {
		selectable = false;
	}
	
	interacted = false;
}

if (selectable == false && timer <= timer_max) {
	timer ++;
}
else {
	selectable = true;
	timer = 0;
}