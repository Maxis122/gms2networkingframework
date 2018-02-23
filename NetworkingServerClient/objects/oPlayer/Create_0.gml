/// @description Init the player

//Init object variables
spd = 5;
hp = 5;
state = player_dead;

//Create camera
camera = instance_create_depth(x, y, 0, oCamera);

//Setup Physics
phy_fixed_rotation = true;

//Choose spawn location
spawned = false;
alarm[0] = room_speed / 4;