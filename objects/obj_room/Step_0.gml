/// @description Insert description here
// You can write your code in this editor
if (darkening && opacity < 1) {
	if (opacity = 0) {
		opacity = 0.01;
	} else {
		opacity *= 1.05;
	}
	opacity = min(opacity, 1);
} else if (!darkening && opacity > 0) {
	if (opacity <= 0.01) {
		opacity = 0;
	} else {
		opacity /= 1.05;
	}
	opacity = max(opacity, 0);
}

if (darkening && opacity >= 1) {
	darkening = false;
	room_restart();
}