/// @description Broadcast alarm
buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_BROADCAST);
buffer_write(Buffer, buffer_string, global.SERVER_NAME);
buffer_write(Buffer, buffer_u8, ds_list_size(SocketList));
buffer_write(Buffer, buffer_u8, global.MAX_CLIENTS);
network_send_broadcast(server_socket, global.PORT, Buffer, buffer_tell(Buffer));
alarm[0] = room_speed;