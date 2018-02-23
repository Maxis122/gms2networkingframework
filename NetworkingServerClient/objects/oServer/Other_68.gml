/// @description Recieve events from the network

var type_event = ds_map_find_value(async_load, "type");
switch(type_event) {
	
	case network_type_connect: //Get connect event, add to socket list.
		var socket = ds_map_find_value(async_load, "socket");
		ds_list_add(SocketList, socket);
		var serverClient = instance_create_depth(0, 0, 0, oServerClient);
		ds_list_add(ServerClients, serverClient);
	break;
	
	case network_type_disconnect: //Get disconnect event. Send to all OTHER clients the socket
								  //of the disconnecting player so they can remove the instance.
								  //Then delete the socket from our list.
		var socket = ds_map_find_value(async_load, "socket");
		var findsocket = ds_list_find_index(SocketList, socket);
		
		buffer_seek(Buffer, buffer_seek_start, 0);
		buffer_write(Buffer, buffer_u8, NETWORK_EVENT_DISCONNECT);
		buffer_write(Buffer, buffer_u16, socket);
		
		for (var i = 0; i < ds_list_size(SocketList); i++) {
			var send_socket = ds_list_find_value(SocketList, i);
			if (send_socket != socket) {
				network_send_packet(send_socket, Buffer, buffer_tell(Buffer));
			}
		}
		
		if (findsocket >= 0) {
			with(oGameMode) {
				var findA = ds_list_find_index(TeamA, socket);
				var findB = ds_list_find_index(TeamB, socket);
				
				if (findA >= 0 or findB >= 0) {
					if (findA < 0) {
						var teamSocket = ds_list_find_index(TeamB, socket);
						ds_list_delete(TeamB, teamSocket);
					} else {
						var teamSocket = ds_list_find_index(TeamA, socket);
						ds_list_delete(TeamA, teamSocket);
					}	
				}	
			}
		
			ds_list_delete(SocketList, findsocket);
			ds_list_delete(ClientNameList, findsocket);
			
			with(ds_list_find_value(ServerClients, findsocket)) {
				instance_destroy();
			}
			ds_list_delete(ServerClients, findsocket);
		}
	break;
	
	case network_type_data: //Recieve a data event. Feed buffer and id into RecievedPacket
							//function for processing.
		var buffer = ds_map_find_value(async_load, "buffer");
		var socket = ds_map_find_value(async_load, "id");
		buffer_seek(buffer, buffer_seek_start, 0);
		RecievedPacket(buffer, socket);
	break;
}
