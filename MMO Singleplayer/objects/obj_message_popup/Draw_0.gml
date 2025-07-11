var _string = string(msg);
var _width = string_width(_string);
var _alpha = 1;
if (lifetime >= lifetime_disappear) {
	_alpha = (((lifetime_max - lifetime_disappear) - (lifetime - lifetime_disappear)) / (lifetime_max - lifetime_disappear));
}
draw_set_alpha(_alpha);
draw_text(x - (_width/2), y, _string);
draw_set_alpha(1);