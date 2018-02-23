/// @description Get chat input

if (oChatBox.txt != "") {

	var chat_txt = oChatBox.txt;
	chat_txt = global.USERNAME + ": " + chat_txt;
			
	ds_list_insert(ChatLog, 0, chat_txt);
	alarm[1] = room_speed * 6;
	ChatAlpha = 0.7;

	buffer_seek(Buffer, buffer_seek_start, 0);
	buffer_write(Buffer, buffer_u8, NETWORK_EVENT_CHAT);
	buffer_write(Buffer, buffer_string, chat_txt);
	buffer_write(Buffer, buffer_bool, false);
	var Result = network_send_packet(Socket, Buffer, buffer_tell(Buffer));
}

with (oChatBox) {
	selected = false;
	txt = "";
}

keyboard_string = "";

with (oInput) {
	canInput = true;
}

alarm[1] = room_speed * 6;