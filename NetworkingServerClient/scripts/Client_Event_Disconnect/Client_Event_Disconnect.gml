///Client_Event_Disconnect(buffer)

//Use the socket given to find the index of the other client on the ClientList and 
//ClientObjectList. Destroy the oOtherClient object and the values in the ds_lists
						   
var buffer = argument0;

var disconenct_socket = buffer_read(buffer, buffer_u16);
var findsocket = ds_list_find_index(ClientList, disconenct_socket);

if (findsocket >= 0) {
	var otherClient = ds_list_find_value(ClientObjectList, findsocket);
	var disconnect_txt = otherClient.name + " has disconnected.";
	ds_list_insert(ChatLog, 0, disconnect_txt);
	ChatAlpha = 0.7;
	alarm[1] = room_speed * 6;

	with(otherClient) {
		instance_destroy();
	}

	
	ds_list_delete(ClientList, findsocket);
	ds_list_delete(ClientObjectList, findsocket);
	
}