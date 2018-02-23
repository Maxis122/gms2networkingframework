/// @description 
if (alarm[1] <= 0) {
	hp += HEALING_RATE;
	
	if (hp > MAX_HP) {
		hp = MAX_HP;
	}
	
	alarm[1] = room_speed;
}
