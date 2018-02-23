/// @description Draw the button

draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_center);

if (selected) {
	draw_set_color(c_orange);
}

draw_text(x, y, button_txt);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);