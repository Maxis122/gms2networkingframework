/// @description Draw Game Over
if (global.GAMESTATE == GAMESTATE_ENDED) {
	draw_set_color(c_black);
	draw_rectangle(0, 0, 640, 360, false);
	draw_set_color(c_white);
	
	draw_set_halign(fa_center);
	draw_set_font(fnt_large);
	draw_text(320, 130, "Game has ended.");
	
	if (oClient.ScoreA > oClient.ScoreB) {
		draw_text(320, 160, "Team A has won.");
	} else {
		draw_text(320, 160, "Team B has won.");
	}
	
	var txtscrA = string(oClient.ScoreA);
	var txtscrB = string(oClient.ScoreB);
	draw_text(320, 190, "A: " + txtscrA + " | B: " + txtscrB);
	
	draw_set_font(fnt_small);
	draw_set_halign(fa_left);
}