///Server_Event_Hit(buffer, socket)

//Recieve the hit socket_id and send a hit event to that client containing the
//socket of the shooter

var buffer = argument0;
var socket = argument1;

var shot_id = buffer_read(buffer, buffer_u16);

buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_HIT);
buffer_write(Buffer, buffer_u16, socket);
network_send_packet(shot_id, Buffer, buffer_tell(Buffer));

