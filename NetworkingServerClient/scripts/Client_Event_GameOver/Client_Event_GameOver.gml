///Client_Event_GameOver(buffer)

var buffer = argument0;

oPlayer.state = player_wait;
oPlayer.spawned = false;
global.GAMESTATE = GAMESTATE_ENDED;