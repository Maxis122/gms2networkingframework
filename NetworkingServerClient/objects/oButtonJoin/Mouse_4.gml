/// @description Send the relevent data to the relevent data areas
if (button_state == BUTTON_JOIN) {
	with (oClientUDP) {
		global.IP = ds_list_find_value(broadcast_ips, other.button_i);
		room_goto(client_username);
	}
} else if (button_state = BUTTON_USERNAME) {
	with (oTextbox) {
		if (text_state == TEXT_USERNAME) {
			global.USERNAME = txt;
			
		}
		
		if (text_state == TEXT_PASSWORD) {
			global.PASSWORD = txt;
		}
		
		instance_destroy();
	}
	
	instance_create_depth(0, 0, 0, oClient);
	instance_destroy();
	
}

