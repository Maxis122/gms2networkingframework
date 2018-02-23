/// @description Ping the server and send player data
buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_PING);
buffer_write(Buffer, buffer_u32, current_time);
var Result = network_send_packet(Socket, Buffer, buffer_tell(Buffer));

if (instance_exists(oPlayer)) {
	if (oPlayer.spawned) {
		buffer_seek(Buffer, buffer_seek_start, 0);
		buffer_write(Buffer, buffer_u8, NETWORK_EVENT_MOVE);
		buffer_write(Buffer, buffer_u16, oPlayer.x); 
		buffer_write(Buffer, buffer_u16, oPlayer.y); 
		buffer_write(Buffer, buffer_u8, global.PlayerTeam);
		Result = network_send_packet(Socket, Buffer, buffer_tell(Buffer));
	}
}


