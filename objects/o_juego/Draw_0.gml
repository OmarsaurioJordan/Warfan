// primero hacer el fondo, los suelos
for (var w = 0; w < g_width_c; w++) {
	for (var h = 0; h < g_height_c; h++) {
		draw_sprite(d_suelos, ds_grid_get(biomas, w, h),
			w * m_wcelda, h * m_hcelda);
	}
}

// sombras de entes
with o_bomba {
	draw_sprite(d_sombras, 2, x, y);
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
