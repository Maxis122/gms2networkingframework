///Server_Event_Login(buffer, socket)

//Check if the username has already been taken and if the provided password is correct. 
//If so, reject the player join. Otherwise, set the player a team and tell it which 
//map to play on.

var buffer = argument0;
var socket = argument1;

var username = buffer_read(buffer, buffer_string);
var password = buffer_read(buffer, buffer_string);

var team = 0, result = 0;

if (ds_list_find_index(ClientNameList, username) < 0 and password == global.PASSWORD) {
	result = NETWORK_SUCCESS;
	
	with (oGameMode) {
		if (ds_list_size(TeamA) >= ds_list_size(TeamB)) {
			ds_list_add(TeamB, socket);
			team = TEAM_B;
		} else {
			ds_list_add(TeamA, socket);
			team = TEAM_A;
		}
	}
} else {
	result = NETWORK_FAILURE;
}



buffer_seek(Buffer, buffer_seek_start, 0);
buffer_write(Buffer, buffer_u8, NETWORK_EVENT_LOGIN);
buffer_write(Buffer, buffer_u8, global.SERVER_ROOM);
buffer_write(Buffer, buffer_u8, team);
buffer_write(Buffer, buffer_u8, result);
buffer_write(Buffer, buffer_bool, game_over);
buffer_write(Buffer, buffer_u8, oGameMode.ScoreA);
buffer_write(Buffer, buffer_u8, oGameMode.ScoreB);
network_send_packet(socket, Buffer, buffer_tell(Buffer));