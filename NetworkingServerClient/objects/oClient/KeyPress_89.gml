/// @description Set chat to true
if (oChatBox.selected != true) {
	with (oChatBox) {
		selected = true;
	}

	with (oInput) {
		canInput = false;
	}

	keyboard_string = "";
	ChatAlpha = 1;
}