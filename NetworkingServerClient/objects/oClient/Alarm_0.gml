/// @description Username Alarm
if (oPlayer.spawned) {
	buffer_seek(Buffer, buffer_seek_start, 0);
	buffer_write(Buffer, buffer_u8, NETWORK_EVENT_USERNAME);
	buffer_write(Buffer, buffer_string, global.USERNAME);
	var Result = network_send_packet(Socket, Buffer, buffer_tell(Buffer));
}
alarm[0] = room_speed * 5;