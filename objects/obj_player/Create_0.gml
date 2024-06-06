/// @description Create event
// You can write your code in this editor

x_spd = 0.08;
y_spd = 0.08;
enum forms {
	SMOL,
	NORMIE,
	CHONK
}

enum facings {
	NORTHEAST,
	SOUTHEAST,
	SOUTHWEST,
	NORTHWEST
}
range = 16;
facing = facings.SOUTHEAST;
formindex = forms.NORMIE;
sprites = [spr_smol, spr_normie, spr_chonk];
sprite_index = sprites[formindex];
formindicators = {"chonk": 0, "normie": 0, "smol": 0};
max_health = 100;
hp = max_health;
max_mana = 100;
mp = max_mana;

iframe = false;

breaktimer = 0;

display_hp = hp;
display_mp = mp;