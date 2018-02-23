///ChooseSpawn(spawn)
var spawn = argument0;
var found = false;
for (var i = 0; i < instance_number(spawn); i += 1)
{
	var point = instance_find(spawn,i);
	if (point.free) {
		phy_position_x = point.x + 16;
		phy_position_y = point.y + 16;
		hp = MAX_HP;
		state = player_normal;
		camera.killed_id = -1;
		return true;
	}
}

return false;