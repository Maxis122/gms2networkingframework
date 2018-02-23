/// @description Destroy network and data structures

network_destroy(Socket);
buffer_delete(Buffer);
ds_list_destroy(ClientList);
ds_list_destroy(ClientObjectList);
ds_list_destroy(ChatLog);
ds_list_destroy(DeadChatLog);
