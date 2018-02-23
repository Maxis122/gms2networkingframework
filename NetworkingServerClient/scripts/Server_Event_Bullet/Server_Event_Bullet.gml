///Server_Event_Bullet(buffer, socket)

//Recieve a bullet creation message from the client and send the direction back to all
//OTHER clients.

var buffer = argument0;
var socket = argument1;

var new_dir = buffer_read(buffer, buffer_u16);
var teamShot = 0;

with (oGameMode) {
	if (ds_list_find_index(TeamA, socket) < 0) {
		teamShot = TEAM_B;
	} else {
		teamShot = TEAM_A;
	}
}

buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_BULLET);
buffer_write(Buffer, buffer_u16, new_dir);
buffer_write(Buffer, buffer_u16, socket);
buffer_write(Buffer, buffer_u8, teamShot);

for (var i = 0; i < ds_list_size(SocketList); i++) {
	var send_socket = ds_list_find_value(SocketList, i);
	if (send_socket != socket) {
		network_send_packet(send_socket, Buffer, buffer_tell(Buffer));
	}
}