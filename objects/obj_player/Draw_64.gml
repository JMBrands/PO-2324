/// @description Insert description here
// You can write your code in this editor
var width = display_get_gui_width();
var height = display_get_gui_height();
draw_text(10, 10, string("{0}, {1}", x, y));
draw_text(500, 10, irandom(100));
draw_text(10, 50, int64((1000000/delta_time)));

// healthbar
draw_healthbar(width/64 + ((width/4)/128) * 2, height - (height/8) + ((height/16)/16) * 9, width/64 + ((width/4)/128) * 126, height - (height/8) + ((height/16)/16) * 12, display_hp / max_health * 100, make_color_rgb(75, 75, 75), make_color_hsv(0, 255, 255), make_color_hsv(120/360*255, 255, 255), 0, 1, 0);
draw_sprite_stretched(spr_healthbar, 0, width / 64, height - (height/8) , width/4, height/16);
// manabar
draw_healthbar(width/64 + ((width/4)/128) * 2, height - (height/16) + ((height/16)/16) * 9, width/64 + ((width/4)/128) * 126, height - (height/16) + ((height/16)/16) * 12, display_mp / max_mana * 100, make_color_rgb(75, 75, 75), make_color_rgb(128, 0, 255), make_color_rgb(0, 128, 255), 0, 1, 0);
draw_sprite_stretched(spr_manabar, 0, width / 64,  height - (height/16), width/4, height/16);

// size indicator
switch (formindex) {
	case forms.CHONK:
		draw_sprite_stretched(spr_chonk_smash, 0, width / 2 - (width/32), height - (width/16) * 1.25 , width/16, width/16);
		if (formindicators.chonk != 1) {
			if (abs(formindicators.chonk - 1) < 0.01) 
				formindicators.chonk = 1;
			else {
				formindicators.chonk += (1 - formindicators.chonk) / 10;
			}
		}
		if (formindicators.normie != 0) {
			if (abs(formindicators.normie) < 0.01) 
				formindicators.normie = 0;
			else {
				formindicators.normie -= formindicators.normie / 10;
			}
		}
		if (formindicators.smol != 0) {
			if (abs(formindicators.smol) < 0.01) 
				formindicators.smol = 0;
			else {
				formindicators.smol -= formindicators.smol / 10;
			}
		}
		break;
	case forms.NORMIE:
		draw_sprite_stretched(spr_normie_slash, 0, width / 2 - (width/32), height - (width/16) * 1.25 , width/16, width/16);
		if (formindicators.chonk != 0) {
			if (abs(formindicators.chonk) < 0.01) 
				formindicators.chonk = 0;
			else {
				formindicators.chonk -= formindicators.chonk / 10;
			}
		}
		if (formindicators.normie != 1) {
			if (abs(1 - formindicators.normie) < 0.01) 
				formindicators.normie = 1;
			else {
				formindicators.normie += abs(1 - formindicators.normie) / 10;
			}
		}
		if (formindicators.smol != 0) {
			if (abs(formindicators.smol) < 0.01) 
				formindicators.smol = 0;
			else {
				formindicators.smol -= formindicators.smol / 10;
			}
		}
		break;
	case forms.SMOL:
		draw_sprite_stretched(spr_smol_dash, 0, width / 2 - (width/32), height - (width/16) * 1.25 , width/16, width/16);
		if (formindicators.chonk != 0) {
			if (abs(formindicators.chonk) < 0.01) 
				formindicators.chonk = 0;
			else {
				formindicators.chonk -= formindicators.chonk / 10;
			}
		}
		if (formindicators.normie != 0) {
			if (abs(formindicators.normie) < 0.01) 
				formindicators.normie = 0;
			else {
				formindicators.normie -= formindicators.normie / 10;
			}
		}
		if (formindicators.smol != 1) {
			if (abs(1 - formindicators.smol) < 0.01) 
				formindicators.smol = 1;
			else {
				formindicators.smol += abs(1 - formindicators.smol) / 10;
			}
		}
		break;
}
draw_sprite_stretched(spr_chonk_ind, 0, width - (width / (5 - formindicators.chonk )), height - (height/8)*2.5, width/4, height/8);
draw_sprite_stretched(spr_normie_ind,0, width - (width / (5 - formindicators.normie)), height - (height/8)*1.75, width/4, height/8);
draw_sprite_stretched(spr_smol_ind,  0, width - (width / (5 - formindicators.smol  )), height - (height/8)*1, width/4, height/8);


draw_text(100,100,obj_room.roomnum);