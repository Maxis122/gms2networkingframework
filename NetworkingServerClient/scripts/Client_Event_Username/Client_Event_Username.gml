///Client_Event_Username(buffer)

//Use the socket given to find out which oOtherObject needs its name updating and then change it.
//Also generate a chat message to show that this has happened.

var buffer = argument0;

var other_id = buffer_read(buffer, buffer_u16);
var username = buffer_read(buffer, buffer_string);
var newUser = buffer_read(buffer, buffer_bool);

var findsocket = ds_list_find_index(ClientList, other_id);
var otherClient = ds_list_find_value(ClientObjectList, findsocket);

if (newUser) {
	var txt = username + " has connected.";
	ds_list_insert(ChatLog, 0, txt);
	ChatAlpha = 0.7;
	alarm[1] = room_speed * 6;
}
otherClient.name = username;



