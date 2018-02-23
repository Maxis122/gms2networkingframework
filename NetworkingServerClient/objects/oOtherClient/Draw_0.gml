/// @description Draw self with username
if (otherTeam == global.PlayerTeam) {
	draw_sprite(sOtherClientTeam, 0, x, y);
	draw_set_color(c_navy);
} else {
	draw_sprite(sOtherClient, 0, x, y);
	draw_set_color(c_red);
}


draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_text(x, y - 30, name);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

draw_set_color(c_white);