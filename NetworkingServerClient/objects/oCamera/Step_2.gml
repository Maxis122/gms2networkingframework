/// @description Follow the player if the player exists
if (instance_exists(oPlayer)) {
	if (oPlayer.state == player_normal) {
		var xx = (oPlayer.x - x) * 0.1;
		var yy = (oPlayer.y - y) * 0.1;
		
		if (shake) {
			xx += random_range(-SHAKE_MAGNITUDE, SHAKE_MAGNITUDE);
			yy += random_range(-SHAKE_MAGNITUDE, SHAKE_MAGNITUDE);
		}
	
		x += xx;
		y += yy;
	} else {
		if (killed_id != -1) {
			var xx = (killed_id.x - x) * 0.1;
			var yy = (killed_id.y - y) * 0.1;
			
			if (shake) {
				xx += random_range(-SHAKE_MAGNITUDE, SHAKE_MAGNITUDE);
				yy += random_range(-SHAKE_MAGNITUDE, SHAKE_MAGNITUDE);
			}
	
			x += xx;
			y += yy;
		}
	}
}
