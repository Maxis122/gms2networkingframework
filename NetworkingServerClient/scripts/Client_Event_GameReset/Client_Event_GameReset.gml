///Client_Event_GameReset(buffer)

var buffer = argument0;

ScoreA = 0;
ScoreB = 0;

oPlayer.state = player_dead;
oPlayer.alarm[0] = room_speed/4;
oPlayer.spawned = false;
global.GAMESTATE = GAMESTATE_PLAYING;