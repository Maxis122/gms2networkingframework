/// @description 
if (spawned) {
	draw_self();
	draw_set_halign(fa_center);
	draw_text(x, y + 20, string(hp) + "/" + string(MAX_HP));
	draw_set_halign(fa_left);
}
