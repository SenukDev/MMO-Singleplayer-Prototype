function craft_item(_tool){
	switch(_tool) {
		case CRAFTING_TOOLS.AXE_TIER_1:
			if (obj_player.inventory[INVENTORY_ITEMS.PLANK] >= 5) {
				obj_player.inventory[INVENTORY_ITEMS.PLANK] -= 5
				crafting = CRAFTING_TOOLS.AXE_TIER_1;
				crafting_timer = 0;
			}
			else {
				crafting = CRAFTING_TOOLS.NOTHING;
				message_popup("You need 5 Planks");
			}
			break;
	}
}