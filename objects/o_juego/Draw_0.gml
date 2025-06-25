// primero hacer el fondo, los suelos
for (var w = 0; w < g_width_c; w++) {
	for (var h = 0; h < g_height_c; h++) {
		draw_sprite(d_suelos, ds_grid_get(biomas, w, h),
			w * m_wcelda, h * m_hcelda);
	}
}

// quemaduras en el suelo
with o_explosion {
	if is_agua {
		var a = min(0.9, lerp(2, 0, reloj_paso / (m_paso_fin_explosion * 2)));
		draw_sprite_ext(d_quemonazo, 1, x, y, 1, 1, 0, c_white, a);
	}
	else {
		var a = min(0.9, lerp(2, 0.333, reloj_paso / (m_paso_fin_explosion * 2)));
		draw_sprite_ext(d_quemonazo, 0, x, y, 1, 1, 0, c_white, a);
	}
}
for (var i = 0; i < ds_list_size(lis_quemones_x); i++) {
	draw_sprite_ext(d_quemonazo, 0,
		ds_list_find_value(lis_quemones_x, i),
		ds_list_find_value(lis_quemones_y, i),
		1, 1, 0, c_white, 0.333);
}

// sombras de entes
with o_bomba {
	switch bomba {
		case m_bomb_normal:
		case m_bomb_nuclear:
			draw_sprite(d_sombras, 0, x, y);
			break;
		case m_bomb_dispersion:
		case m_bomb_linea:
			draw_sprite(d_sombras, 2, x, y);
			break;
	}
}
with o_bombardero {
	draw_sprite(d_sombras, 0, x, y);
}
with o_dron {
	draw_sprite(d_sombras, 2, x, y);
}
with o_nuclear {
	draw_sprite(d_sombras, 1, x, y);
}
with o_paracaidas {
	if reloj_vuelo != 0 {
		draw_sprite(d_sombras, 3 + nivel, x, y);
	}
	else {
		draw_sprite(d_sombras, 2, x, y);
	}
}
with o_soldado {
	draw_sprite(d_sombras, 2, x, y);
}
