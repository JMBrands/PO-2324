/// @description Create event
// You can write your code in this editor

x_spd = 0.08;
y_spd = 0.08;
enum forms {
	SMOL,
	NORMIE,
	CHONK
}

formindex = forms.NORMIE;
sprites = [spr_smol, spr_normie, spr_chonk];
sprite_index = sprites[formindex];