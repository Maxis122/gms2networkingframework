/// @description Send the relevent data to the relevent data areas
if (button_state == BUTTON_JOIN) {
	with (oTextbox) {
		if (text_state == TEXT_IPADDRESS) {
			global.IP = txt;
		}
		
		if (text_state == TEXT_PORT) {
			global.PORT = real(txt);
		}
	}
	
	room_goto(client_username);
	
} else if (button_state == BUTTON_CREATE) {
	with (oTextbox) {
		if (text_state == TEXT_PORT) {
			global.PORT = real(txt);
		}
		
		if (text_state == TEXT_MAX_CLIENTS) {
			global.MAX_CLIENTS = real(txt);
		}
		
		if (text_state == TEXT_SERVER_NAME) {
			global.SERVER_NAME = txt;
		}
		
		if (text_state == TEXT_PASSWORD) {
			global.PASSWORD = txt;
		}
		
		if (text_state == TEXT_WINNING_SCORE) {
			global.WINNING_SCORE = real(txt);
		}
	}
	
	room_goto(server);
}

