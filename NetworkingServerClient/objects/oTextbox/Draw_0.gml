/// @description Draw the text
draw_self();

draw_set_font(fnt_small);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

var show_txt = "";

if (text_state == TEXT_PASSWORD) {
	for (var i = 0; i < string_length(txt); i++) {
		show_txt += "*";
	}
} else {
	show_txt = txt;
}

if !(txt == "") {
	if (blink == false) || (selected = false) {
		draw_text(x, y, show_txt);
	} else {
		draw_text(x, y, show_txt + "|");
	}
}

draw_text(x, y - 40, text_above);

draw_set_halign(fa_left);
draw_set_valign(fa_top);