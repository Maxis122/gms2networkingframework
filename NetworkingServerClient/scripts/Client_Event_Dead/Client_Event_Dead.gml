///Client_Event_Dead(buffer)

//Recieve the socket_id of the dead and hide it.

var buffer = argument0;

var dead_id = buffer_read(buffer, buffer_u16);
var move_inx = ds_list_find_index(ClientList, dead_id);

if (move_inx >= 0) {
	var move_obj = ds_list_find_value(ClientObjectList, move_inx);
	move_obj.phy_position_x = -100;
	move_obj.phy_position_y = -100;
	
	if (move_obj.otherTeam == TEAM_A) {
		ScoreB++;
	} else {
		ScoreA++;
	}
}
