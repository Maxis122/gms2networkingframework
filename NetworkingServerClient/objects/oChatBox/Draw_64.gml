/// @description Draw the text
draw_set_font(fnt_small);

if (selected) {
	if (blink == false) {
		draw_text(5, 340, "[ALL] " + txt);
	} else {
		draw_text(5, 340, "[ALL] " + txt + "|");
	}
}