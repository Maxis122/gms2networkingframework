//Handle Movement
if !(oInput.hspd == 0 and oInput.vspd == 0) {
	var dir = point_direction(0, 0, oInput.hspd, oInput.vspd);
	oInput.hspd = lengthdir_x(spd, dir);
	oInput.vspd = lengthdir_y(spd, dir);
}
phy_position_x += oInput.hspd;
phy_position_y += oInput.vspd;

//Handle Shooting
if (oInput.shoot) {
	var dir = point_direction(x, y, mouse_x, mouse_y);
	dir = round(dir);
	
	var shot = instance_create_depth(x + lengthdir_x(SHOT_SPEED, dir), 
									 y + lengthdir_y(SHOT_SPEED, dir), 0, oBullet);
	shot.move_x = lengthdir_x(SHOT_SPEED, dir);
	shot.move_y = lengthdir_y(SHOT_SPEED, dir);
	
	//Send server message
	with (oClient) {
		buffer_seek(Buffer, buffer_seek_start, 0);
		buffer_write(Buffer, buffer_u8, NETWORK_EVENT_BULLET);
		buffer_write(Buffer, buffer_u16, dir);
		var Result = network_send_packet(Socket, Buffer, buffer_tell(Buffer));
	}
}

if (hp <= 0) {
	if (state != player_wait) {
		state = player_dead;
	}
	alarm[0] = room_speed * 4;
	spawned = false;
	
	//Send the dead packet
	with (oClient) {
		buffer_seek(Buffer, buffer_seek_start, 0);
		buffer_write(Buffer, buffer_u8, NETWORK_EVENT_DEAD);
		var Result2 = network_send_packet(Socket, Buffer, buffer_tell(Buffer));
		
		//Increment the score for the other team
		if (global.PlayerTeam == TEAM_A) {
			oClient.ScoreB++;
		} else {
			oClient.ScoreA++;
		}
		
		//Send the dead message
		var shot_inx = ds_list_find_index(ClientList, LastHit);
		var shot_id = ds_list_find_value(ClientObjectList, shot_inx);
		var shot_name = shot_id.name;
		
		var dead_txt = shot_name + " killed " + global.USERNAME;
		
		ds_list_insert(DeadChatLog, 0, dead_txt);
		alarm[2] = room_speed * 6;
		DeadChatAlpha = 0.5;
		
		buffer_seek(Buffer, buffer_seek_start, 0);
		buffer_write(Buffer, buffer_u8, NETWORK_EVENT_CHAT);
		buffer_write(Buffer, buffer_string, dead_txt);
		buffer_write(Buffer, buffer_bool, true);
		var Result = network_send_packet(Socket, Buffer, buffer_tell(Buffer));
		
		//Set camera to follow killer
		other.camera.killer_id = shot_id;
	}
}