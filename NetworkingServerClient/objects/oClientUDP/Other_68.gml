/// @description Check for Broadcasts
var type_event = ds_map_find_value(async_load, "type");
switch(type_event) {
	case network_type_data:
		var buffer = ds_map_find_value(async_load, "buffer");
		buffer_seek(buffer, buffer_seek_start, 0);
		
		var message_id = buffer_read(buffer, buffer_u8);
		
		switch(message_id) {
			case NETWORK_EVENT_BROADCAST:
				var broadcast_name = buffer_read(buffer, buffer_string);
				var joined_clients = buffer_read(buffer, buffer_u8);
				var max_clients = buffer_read(buffer, buffer_u8);
		
				if (ds_list_find_index(broadcast_names, broadcast_name) < 0) {
					ds_list_add(broadcast_names, broadcast_name);
					ds_list_add(broadcast_ips, async_load[? "ip"]);
					ds_list_add(broadcast_joined_clients, joined_clients);
					ds_list_add(broadcast_max_clients, max_clients);
					
					
					var join_position = ds_list_size(broadcast_ips) - 1;
					var join_button = instance_create_depth(570, 115 + ((ds_list_size(broadcast_ips) - 1) * 15), 0, oButtonJoin);
					with(join_button) {
						button_i = join_position;
					}
				}
				
				
			
			break;
		}
			
	break;
}
