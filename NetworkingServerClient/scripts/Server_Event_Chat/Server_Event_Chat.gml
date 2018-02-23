///Server_Event_Chat(buffer, socket)

//Recieve the chat message from a client. Send it to all OTHER clients.

var buffer = argument0;
var socket = argument1;

var chat_txt = buffer_read(buffer, buffer_string);
var dead_txt = buffer_read(buffer, buffer_bool);

buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_CHAT);
buffer_write(Buffer, buffer_string, chat_txt);
buffer_write(Buffer, buffer_bool, dead_txt);

for (var i = 0; i < ds_list_size(SocketList); i++) {
	var send_socket = ds_list_find_value(SocketList, i);
	if (send_socket != socket) {
		network_send_packet(send_socket, Buffer, buffer_tell(Buffer));
	}
}