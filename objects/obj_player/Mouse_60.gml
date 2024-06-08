/// @description Insert description here
// You can write your code in this editor
var enough_space = true;
	
switch (formindex) {
	case forms.SMOL:
		enough_space = place_free(x + 8, y);
		enough_space = enough_space ? place_free(x + 8, y + 8) : false;
		enough_space = enough_space ? place_free(x, y + 8) : false;
		enough_space = enough_space ? place_free(x - 8, y + 8) : false;
		enough_space = enough_space ? place_free(x - 8, y) : false;
		break;
	case forms.NORMIE:
		enough_space = place_free(x + 16, y);
		enough_space = enough_space ? place_free(x + 16, y + 16) : false;
		enough_space = enough_space ? place_free(x, y + 16) : false;
		enough_space = enough_space ? place_free(x - 16, y + 16) : false;
		enough_space = enough_space ? place_free(x - 16, y) : false;
		break;
	case forms.CHONK:
		break;
}
if (enough_space) {
	formindex++;
	formindex %= 3;
	sprite_index = sprites[formindex];
}