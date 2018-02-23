/// @description Create the client

var
Type;

Type = network_socket_tcp;
Socket = network_create_socket(Type);
isConnected = network_connect(Socket, global.IP, global.PORT);

var
Size,
Type,
Alignment;

Size = 1024;
Type = buffer_fixed;
Alignment = 1;
Buffer = buffer_create(Size, Type, Alignment);

Ping = 0;
LastHit = -1;

//List of clients and their objects
ClientList = ds_list_create();
ClientObjectList = ds_list_create();

//Chat Log
ChatLog = ds_list_create();
ChatMaxSize = 10;
ChatAlpha = 0.7;

//Dead Chat log
DeadChatLog = ds_list_create();
DeadChatMaxSize = 5;
DeadChatAlpha = 0;

//Gamestate
ScoreA = 0;
ScoreB = 0;
global.PlayerTeam = -1;
global.GAMESTATE = GAMESTATE_ENDED;

//Send Login Request
buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_LOGIN);
buffer_write(Buffer, buffer_string, global.USERNAME);
buffer_write(Buffer, buffer_string, global.PASSWORD);
var Result = network_send_packet(Socket, Buffer, buffer_tell(Buffer));
ClientConnected = false;


