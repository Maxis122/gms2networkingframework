/// @description Draw the server information
draw_text(5, 5, "Server Status: " + string(Server >= 0));
draw_text(5, 20, "Total Clients: " + string(ds_list_size(SocketList)));

draw_text(5, 50, "Clients Conneceted: ");

draw_text(5, 65, "Team A: " + string(oGameMode.ScoreA));
for (var i = 0; i < ds_list_size(oGameMode.TeamA); i++) {
	var yy = 80 + (15*i);
	
	var player_socket = ds_list_find_value(oGameMode.TeamA, i);
	var player_inx = ds_list_find_index(SocketList, player_socket);
	
	draw_text(5, yy, ds_list_find_value(ClientNameList, player_inx));
	
	var serverClient = ds_list_find_value(ServerClients, player_inx);
	draw_text(200, yy, "x:" + string(serverClient.x));
	draw_text(250, yy, "y:" + string(serverClient.y));
}

draw_text(330, 65, "Team B: " + string(oGameMode.ScoreB));
for (var i = 0; i < ds_list_size(oGameMode.TeamB); i++) {
	var yy = 80 + (15*i);
	
	var player_socket = ds_list_find_value(oGameMode.TeamB, i);
	var player_inx = ds_list_find_index(SocketList, player_socket);
	
	draw_text(330, yy, ds_list_find_value(ClientNameList, player_inx));
	
	var serverClient = ds_list_find_value(ServerClients, player_inx);
	draw_text(525, yy, "x:" + string(serverClient.x));
	draw_text(575, yy, "y:" + string(serverClient.y));
}