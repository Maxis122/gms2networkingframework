/// @description Check team and then change into oCollision 
if (global.PlayerTeam == TEAM_A) {
	var new_wall = instance_create_depth(x, y, 0, oBlockerB_Solid);
	instance_destroy();
}