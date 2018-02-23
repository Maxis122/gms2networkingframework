///Server_Event_Move(buffer, socket)

//Recieve movement data from a client. Send it to all OTHER clients and
//with the socket for identification at the client side.

var buffer = argument0;
var socket = argument1;

var xx = buffer_read(buffer, buffer_u16);
var yy = buffer_read(buffer, buffer_u16);
var team = buffer_read(buffer, buffer_u8);

var move_inx = ds_list_find_index(SocketList, socket);
var serverClient = ds_list_find_value(ServerClients, move_inx);
serverClient.x = xx;
serverClient.y = yy;

buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_MOVE);
buffer_write(Buffer, buffer_u16, socket);
buffer_write(Buffer, buffer_u16, xx);
buffer_write(Buffer, buffer_u16, yy);
buffer_write(Buffer, buffer_u8, team);

for (var i = 0; i < ds_list_size(SocketList); i++) {
	var send_socket = ds_list_find_value(SocketList, i);
	if (send_socket != socket) {
		network_send_packet(send_socket, Buffer, buffer_tell(Buffer));
	}
}