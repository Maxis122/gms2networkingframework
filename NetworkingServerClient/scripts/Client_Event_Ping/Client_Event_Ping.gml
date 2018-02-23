///Client_Event_Ping(buffer)

//Recieve the time from the server and find the difference with the current time.

var buffer = argument0;

var time = buffer_read(buffer, buffer_u32);
Ping = current_time - time;