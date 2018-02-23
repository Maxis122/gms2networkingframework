///Client_Event_Chat(buffer)

//Recieve the chat message and put it into the ChatLog ds_list.

var buffer = argument0;

var chat_msg = buffer_read(buffer, buffer_string);
var dead_txt = buffer_read(buffer, buffer_bool);

if (dead_txt) {
	ds_list_insert(DeadChatLog, 0, chat_msg);
	DeadChatAlpha = 0.5;
	alarm[2] = room_speed * 3;
} else {
	ds_list_insert(ChatLog, 0, chat_msg);
	ChatAlpha = 0.7;
	alarm[1] = room_speed * 6;
}