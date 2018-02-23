///Client_Event_Bullet(buffer)

//Use the socket provided to find the location of the shooter. Create the oOtherBullet
//and assign it the speed and direction so it can move.

var buffer = argument0;

var shoot_dir = buffer_read(buffer, buffer_u16);
var shooter_socket = buffer_read(buffer, buffer_u16);
var team_shot = buffer_read(buffer, buffer_u8);

var shoot_x = lengthdir_x(SHOT_SPEED, shoot_dir);
var shoot_y = lengthdir_y(SHOT_SPEED, shoot_dir);

var findsocket = ds_list_find_index(ClientList, shooter_socket);
var otherClient = ds_list_find_value(ClientObjectList, findsocket);

var shot = instance_create_depth(otherClient.x + lengthdir_x(SHOT_SPEED, shoot_dir), 
								 otherClient.y + lengthdir_y(SHOT_SPEED, shoot_dir), 
								 0, oOtherBullet);
shot.move_x = shoot_x;
shot.move_y = shoot_y;
shot.teamShot = team_shot;

