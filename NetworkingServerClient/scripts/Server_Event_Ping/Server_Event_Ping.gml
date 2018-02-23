///Server_Event_Ping(buffer, socket)

//Recieve the time from the client and send it back.

var buffer = argument0;
var socket = argument1;

var time = buffer_read(buffer, buffer_u32);
buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_PING);
buffer_write(Buffer, buffer_u32, time);
network_send_packet(socket, Buffer, buffer_tell(Buffer));