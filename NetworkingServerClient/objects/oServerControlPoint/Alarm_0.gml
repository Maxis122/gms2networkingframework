/// @description Update the score
if (controlStatus == 2) {
	oGameMode.ScoreA++;
} else if (controlStatus == 0) {
	oGameMode.ScoreB++;
}
alarm[0] = room_speed;
