/// @description Get the inputs
if (canInput) {
	hspd = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	vspd = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	shoot = mouse_check_button_pressed(mb_left);
}