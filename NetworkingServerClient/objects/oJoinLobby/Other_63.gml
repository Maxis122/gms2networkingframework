/// @description Get dialog data for IP
var i_d = ds_map_find_value(async_load, "id");
if (i_d == msg_id) {
	if (ds_map_find_value(async_load, "status")) {
		if (ds_map_find_value(async_load, "result") != "") {
			global.IP = ds_map_find_value(async_load, "result");
			room_goto(level_1);
		}
	}
}