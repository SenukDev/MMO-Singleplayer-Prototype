function message_popup(_message){
	var _popup = instance_create_depth(obj_player.x, obj_player.y - 64, -9999, obj_message_popup);
	_popup.msg = _message;
}