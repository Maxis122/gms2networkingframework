/// @description Choose spawn location
if (state != player_wait) {
	if (global.PlayerTeam == TEAM_A) {
		spawned = ChooseSpawn(oSpawnA);
	} else {
		spawned = ChooseSpawn(oSpawnB);
	}
}

if (!spawned) {
	alarm[0] = room_speed / 4;
}