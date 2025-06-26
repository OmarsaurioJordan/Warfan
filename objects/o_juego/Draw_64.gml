var e = 0.8;

// indicadores de viento
var esc, xx, yy;
var ava = lerp(-1, m_viento_historial,
	reloj_viento / m_viento_reloj_max);
for (var i = 0; i < m_viento_historial; i++) {
	xx = (50 + 100 * i) * e;
	yy = 50 * e;
	draw_sprite_ext(d_gui, 1, xx, yy,
		e, e, 0, c_white, 0.666);
	if ava < i {
		draw_sprite_ext(d_gui, 22, xx, yy,
			e, e, 0, c_lime, 0.333);
	}
	if histo_viento_vel[i] == 0 {
		draw_sprite_ext(d_gui, 2, xx, yy,
			e, e, 0, c_white, 1);
	}
	else {
		esc = lerp(0.25, 1, histo_viento_vel[i] / 3);
		draw_sprite_ext(d_gui, 0, xx, yy,
			esc * e, esc * e, histo_viento_ang[i], c_white, 1);
	}
}

// temporizador de finalizacion


// recursos propios
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
for (var i = 0; i < 3; i++) {
	xx = 40 * e;
	yy = room_height * 0.3 + (i - 1.5) * 60 * e;
	draw_sprite_ext(d_gui, 6, xx, yy,
		e, e, 0, c_white, 0.666);
	draw_sprite_ext(d_gui, 8 + i, xx, yy,
		e, e, 0, c_white, 1);
	draw_text_transformed_color(xx + 85 * e, yy,
		string(floor(recurso[g_migrupo, i])), e, e,
		0, c_black, c_black, c_black, c_black, 1);
}

// botones contextuales


// estado general de grupos
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
var k = 0;
for (var i = 0; i < 4; i++) {
	if recurso[i, m_rec_vivo] == 1 { // Quitar es 0
		continue;
	}
	xx = room_width - 40 * e;
	yy = (35 + k * 60) * e;
	k++;
	draw_sprite_ext(d_gui, 7, xx, yy,
		-e, e, 0, c_white, 0.666);
	draw_sprite_ext(d_gui, 11, xx, yy,
		0.75 * e, 0.75 * e, 0, c_white, 1);
	draw_sprite_ext(d_gui_color, 11, xx, yy,
		0.75 * e, 0.75 * e, 0, g_color[i], 1);
	if ver_porcentajes {
		draw_text_transformed_color(xx - 45 * e, yy,
			string(recurso[i, m_rec_porcent]) + " %",
			e, e, 0, c_black, c_black, c_black, c_black, 1);
	}
	else {
		draw_text_transformed_color(xx - 45 * e, yy,
			string(recurso[i, m_rec_poblacion]) + " | " +
			string(recurso[i, m_rec_edificios]),
			e, e, 0, c_black, c_black, c_black, c_black, 1);
	}
}

// minimapa tactico

