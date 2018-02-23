//Client_Event_Login(buffer)

var buffer = argument0;

var roomCode = buffer_read(buffer, buffer_u8);
var team = buffer_read(buffer, buffer_u8);
var result = buffer_read(buffer, buffer_u8);
var game_over = buffer_read(buffer, buffer_bool);
ScoreA = buffer_read(buffer, buffer_u8);
ScoreB = buffer_read(buffer, buffer_u8);

//Init the team
global.PlayerTeam = -1;

//Check if we connected successfully
if (result == NETWORK_FAILURE) {
	show_message("Username already taken!");
	instance_destroy();
	room_restart();
} else {
	//Set the team
	global.PlayerTeam = team;

	//Goto the level
	switch(roomCode) {
		case LEVEL_ONE:
			room_goto(level_1);
		break;
		
		case LEVEL_TWO:
			room_goto(level_2);
		break;
	}
	
	var player = instance_create_depth(0, 0, 0, oPlayer);
	if (game_over) {
		player.state = player_wait;
		global.GAMESTATE = GAMESTATE_ENDED;
	} else {
		global.GAMESTATE = GAMESTATE_PLAYING;
	}

	//Send Username
	alarm[0] = 5;
	
	//Connection Complete
	ClientConnected = true;
}