/// @description Destroy data structures
ds_list_destroy(TeamA);
ds_list_destroy(TeamB);

if (global.GAMEMODE == GAMEMODE_CPS) {
	ds_list_destroy(ControlPoints);
}
