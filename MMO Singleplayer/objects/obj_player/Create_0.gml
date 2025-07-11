state = "idle";
facing_direction = 270;

velocity_x = 0;
velocity_y = 0;

move_target_x = x;
move_target_y = y;

move_input_type = "target";
move_input_type_timer = 0;
move_input_type_timer_threshold = 10;

selected_node = noone;

collision_radius = 8;
collision_offset_y = -8;

interaction_once_per_cycle = false;

move_speed = 1.5;

global.debug = false;

enum INVENTORY_ITEMS {
	LOG,
	PLANK
}

enum CRAFTING_TOOLS {
	NOTHING,
	AXE_TIER_1
}

enum TOOLS {
	NOTHING,
	AXE_0,
	AXE_1,
	AXE_2
}

inventory = array_create(2, 0);

crafting = CRAFTING_TOOLS.NOTHING;
crafting_timer = 0;
crafting_timer_max = 60;

reveal = TOOLS.NOTHING;

tool_axe = TOOLS.AXE_0;
tool_axe_multiplier = 1;

