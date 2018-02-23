/// @description Draw out server names
draw_text(5, 100, "Server Name: ");
draw_text(300, 100, "IP Address: ");
draw_text(450, 100, "Capacity: "); 

for (var i = 0; i < ds_list_size(broadcast_names); i++) {
	draw_text(5, 115 + (i * 15), ds_list_find_value(broadcast_names, i));
	draw_text(300, 115 + (i * 15), ds_list_find_value(broadcast_ips, i));
	draw_text(450, 115 + (i * 15), string(ds_list_find_value(broadcast_joined_clients, i)) + " / " + string(ds_list_find_value(broadcast_max_clients, i)));
}