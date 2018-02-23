/// @description Input the port and reset the UDP Client
with (oTextbox) {
	if (text_state == TEXT_PORT) {
		global.PORT = real(txt);
	}
}

with (oClientUDP) {
	instance_destroy();
}

with (oButtonJoin) {
	instance_destroy();
}

instance_create_depth(0, 0, 0, oClientUDP);