/// @description Init the UDP Client
udp_listener = network_create_socket_ext(network_socket_udp, global.PORT);

broadcast_names = ds_list_create();
broadcast_ips = ds_list_create();
broadcast_joined_clients = ds_list_create();
broadcast_max_clients = ds_list_create();