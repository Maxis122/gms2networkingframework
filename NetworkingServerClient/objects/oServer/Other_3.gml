/// @description Destroy network and data structures
network_destroy(Server);
buffer_delete(Buffer);
ds_list_destroy(SocketList); 
ds_list_destroy(ClientNameList);
ds_list_destroy(ServerClients);
