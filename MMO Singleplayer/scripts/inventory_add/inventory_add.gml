function inventory_add(_type, _amount){
	var _popup = instance_create_depth(obj_player.x, obj_player.y - 64, -9999, obj_inventory_popup);
	_popup.inventory_type = _type;
	_popup.amount = _amount;
	
	obj_player.inventory[_type] += _amount;
}