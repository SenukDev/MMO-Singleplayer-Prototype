if (selectable && interacted) {
	if (obj_player.inventory[INVENTORY_ITEMS.LOG] >= 10) {
		progress ++;
		
		if progress >= progress_max {
			progress = 0;
			obj_player.inventory[INVENTORY_ITEMS.LOG] -= 10;
			inventory_add(INVENTORY_ITEMS.PLANK, 1);
			if (obj_player.selected_node == id) {
				obj_player.selected_node = noone;
			}
		}
	}
	else {
		if (obj_player.selected_node == id) {
			message_popup("You need 10 Logs");
			obj_player.selected_node = noone;
		}
	}
	
	interacted = false;
}