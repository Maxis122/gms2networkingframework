///Client_Event_Move(buffer)

//Use the socket_id to find if the other client exists in the game yet. If not then create 
//a new one. Give both their new position.

var buffer = argument0;

var move_id = buffer_read(buffer, buffer_u16);
var xx = buffer_read(buffer, buffer_u16);
var yy = buffer_read(buffer, buffer_u16);
var team = buffer_read(buffer, buffer_u8);

var move_inx = ds_list_find_index(ClientList, move_id);


if (move_inx < 0) {
	ds_list_add(ClientList, move_id);
	var move_obj = instance_create_depth(xx, yy, 0, oOtherClient);
	move_obj.socket_id = move_id;
	move_obj.otherTeam = team;
	ds_list_add(ClientObjectList, move_obj);
} else {
	var move_obj = ds_list_find_value(ClientObjectList, move_inx);
	move_obj.phy_position_x = xx;
	move_obj.phy_position_y = yy;
}