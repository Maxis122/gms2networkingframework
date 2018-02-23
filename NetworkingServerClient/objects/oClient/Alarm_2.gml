/// @description Chat Alpha Alarm
if (DeadChatAlpha > 0) {
	DeadChatAlpha += -0.05;
	alarm[2] = 5;
} else if (ds_list_size(DeadChatLog) > 0) {
	ds_list_clear(DeadChatLog);
}
