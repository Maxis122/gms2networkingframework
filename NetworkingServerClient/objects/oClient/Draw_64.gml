/// @description Draw client network information

if (global.GAMESTATE == GAMESTATE_PLAYING) {
	draw_text(5, 5, "Ping: " + string(Ping));
	//draw_text(5, 5, "Client Connected: " + string(isConnected));
	//draw_text(5, 35, "Other Clients connected: " + string(ds_list_size(ClientList)) + "/" + string(ds_list_size(ClientObjectList)));

	//Instructions
	draw_text(5, 35, "Movement: W-A-S-D  |  Chat: Y  | LMB: Shoot");

	//Score
	draw_set_halign(fa_right);
	draw_text(600, 5, "Team A: " + string(ScoreA) + " | Team B: " + string(ScoreB));

	//Username
	if (global.PlayerTeam == TEAM_A) {
		draw_text(600, 20, "Team A | " + global.USERNAME);
	} else {
		draw_text(600, 20, "Team B | " + global.USERNAME);
	}
	draw_set_halign(fa_left);
}

//Chat
if (ds_list_size(ChatLog) > 0 and ChatAlpha > 0) {
	for (var i = 0; i < ds_list_size(ChatLog) and i <= ChatMaxSize; i++) {
		var txt_position_y = 325 - (i * 15);
		
		var txt = ds_list_find_value(ChatLog, i);
		
		draw_text_color(5, txt_position_y, txt, c_white, c_white, c_white, c_white, ChatAlpha);
	}
}

//Dead Chat
draw_set_halign(fa_right);
if (ds_list_size(DeadChatLog) > 0 and DeadChatAlpha > 0) {
	for (var i = 0; i < ds_list_size(DeadChatLog) and i <= DeadChatMaxSize; i++) {
		var txt_position_y = 325 - (i * 15);
		
		var txt = ds_list_find_value(DeadChatLog, i);
		
		draw_text_color(600, txt_position_y, txt, c_white, c_white, c_white, c_white, DeadChatAlpha);
	}
}
draw_set_halign(fa_left);