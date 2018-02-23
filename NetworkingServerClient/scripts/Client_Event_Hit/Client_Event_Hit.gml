///Client_Event_Hit(buffer)

//Recieve the shot event. Set the last hit variable and deduct hp

var buffer = argument0;

LastHit = buffer_read(buffer, buffer_u16);

oPlayer.hp -= 1;

with (oPlayer.camera) {
	shake = true;
	alarm[0] = 10;
}
