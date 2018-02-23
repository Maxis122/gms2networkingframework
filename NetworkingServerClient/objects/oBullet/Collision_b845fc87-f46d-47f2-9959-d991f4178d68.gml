/// @description Favour the shooter system
if (other.otherTeam != global.PlayerTeam) {
	var shot_socket = other.socket_id;

	with (oClient) {
		buffer_seek(Buffer, buffer_seek_start, 0);
		buffer_write(Buffer, buffer_u8, NETWORK_EVENT_HIT);
		buffer_write(Buffer, buffer_u16, shot_socket);
		var Result = network_send_packet(Socket, Buffer, buffer_tell(Buffer));
	}

	instance_destroy();
}