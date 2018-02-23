/// @description Create the server
var
Type;

Type = network_socket_tcp;

Server = network_create_server(Type, global.PORT, global.MAX_CLIENTS);
server_socket = network_create_socket(network_socket_tcp);

var
Size,
Type,
Alignment;

Size = 1024;
Type = buffer_fixed;
Alignment = 1;
Buffer = buffer_create(Size, Type, Alignment);

SocketList = ds_list_create();
ClientNameList = ds_list_create();
ServerClients = ds_list_create();


game_over = false;
alarm[0] = 10;