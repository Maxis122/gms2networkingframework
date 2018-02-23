///Server_Event_Dead(buffer, socket);

//Recive the socket of the dead and send it too all OTHER clients

var buffer = argument0;
var socket = argument1;

buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_DEAD);
buffer_write(Buffer, buffer_u16, socket);

for (var i = 0; i < ds_list_size(SocketList); i++) {
	var send_socket = ds_list_find_value(SocketList, i);
	if (send_socket != socket) {
		network_send_packet(send_socket, Buffer, buffer_tell(Buffer));
	}
}

//Calculate point gain
var onA = ds_list_find_index(oGameMode.TeamA, socket);
var onB = ds_list_find_index(oGameMode.TeamB, socket);

if (onA > onB) {
	oGameMode.ScoreB++;
	if (oGameMode.ScoreB == global.WINNING_SCORE) {
		buffer_seek(Buffer, buffer_seek_start, 0);
		buffer_write(Buffer, buffer_u8, NETWORK_EVENT_GAMEOVER);
		for (var i = 0; i < ds_list_size(SocketList); i++) {
			var send_socket = ds_list_find_value(SocketList, i);
			network_send_packet(send_socket, Buffer, buffer_tell(Buffer));
		}
		game_over = true;
		alarm[1] = room_speed * 10;
	}
} else {
	oGameMode.ScoreA++;
	if (oGameMode.ScoreA == global.WINNING_SCORE) {
		buffer_seek(Buffer, buffer_seek_start, 0);
		buffer_write(Buffer, buffer_u8, NETWORK_EVENT_GAMEOVER);
		for (var i = 0; i < ds_list_size(SocketList); i++) {
			var send_socket = ds_list_find_value(SocketList, i);
			network_send_packet(send_socket, Buffer, buffer_tell(Buffer));
		}
		game_over = true;
		alarm[1] = room_speed * 10;
	}
}