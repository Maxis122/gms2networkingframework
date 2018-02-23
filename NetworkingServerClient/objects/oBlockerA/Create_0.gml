/// @description Check team and then change into oCollision 
if (global.PlayerTeam == TEAM_B) {
	var new_wall = instance_create_depth(x, y, 0, oBlockerA_Solid);
	instance_destroy();
}