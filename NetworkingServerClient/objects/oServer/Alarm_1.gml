/// @description Restart the game
game_over = false;
oGameMode.ScoreA = 0;
oGameMode.ScoreB = 0;

buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_GAMERESET);
		
for (var i = 0; i < ds_list_size(SocketList); i++) {
	var send_socket = ds_list_find_value(SocketList, i);
	network_send_packet(send_socket, Buffer, buffer_tell(Buffer));
}