var _string = "+" + string(amount);
var _width = string_width(_string) + 29;
var _alpha = 1;
if (lifetime >= lifetime_disappear) {
	_alpha = (((lifetime_max - lifetime_disappear) - (lifetime - lifetime_disappear)) / (lifetime_max - lifetime_disappear));
}
draw_set_alpha(_alpha);
draw_text(x - (_width/2), y, _string);
draw_sprite_ext(spr_inventory, inventory_type, x + string_width(_string) + 13 - (_width/2), y + 8, 0.75, 0.75, 0, c_white, _alpha);
draw_set_alpha(1);