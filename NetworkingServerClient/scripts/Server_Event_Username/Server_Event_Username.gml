///Server_Event_Username(buffer, socket)

//Recieve username data from a client. Add the username to the
//ClientNameList at the same index as the socket, unless it has already
//been added. Then send the username to all OTHER clients.

var buffer = argument0;
var socket = argument1;

var username = buffer_read(buffer, buffer_string);
var findsocket = ds_list_find_index(SocketList, socket);
var newUser = false;

if (ds_list_find_index(ClientNameList, username) < 0) {
	//New name
	ds_list_insert(ClientNameList, findsocket, username);
	newUser = true;
} 

buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_USERNAME);
buffer_write(Buffer, buffer_u16, socket);
buffer_write(Buffer, buffer_string, username);
buffer_write(Buffer, buffer_bool, newUser);

for (var i = 0; i < ds_list_size(SocketList); i++) {
	var send_socket = ds_list_find_value(SocketList, i);
	if (send_socket != socket) {
		network_send_packet(send_socket, Buffer, buffer_tell(Buffer));
	}
}