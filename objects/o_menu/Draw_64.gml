// primero hacer el fondo, los suelos
for (var w = 0; w < g_width_c; w++) {
	for (var h = 0; h < g_height_c; h++) {
		draw_sprite(d_suelos, ds_grid_get(biomas, w, h),
			w * m_wcelda, h * m_hcelda);
	}
}

// titulo y creditos
draw_sprite(d_titulo, 0, room_width / 2, room_height * 0.05);
draw_sprite_ext(d_creditos, 0, room_width * 0.95, room_height * 0.95,
	0.75, 0.75, 0, c_white, 1);
draw_sprite_ext(d_gamejam, 0, room_width * 0.05, room_height * 0.95,
	0.75, 0.75, 0, c_white, 1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed_color(room_width / 2, room_height * 0.45,
	"ENTER\nmapa pequeño (Web)",
	1.2, 1.2, 0, c_maroon, c_maroon, c_maroon, c_maroon, 1);
draw_text_transformed_color(room_width / 2, room_height * 0.6,
	"ESPACIO\nmapa grande (PC)",
	1.2, 1.2, 0, c_navy, c_navy, c_navy, c_navy, 1);

// version
draw_text_transformed_color(room_width / 2, room_height * 0.95,
	"DEMO v0.52",
	1, 1, 0, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);

// mouse
draw_sprite(d_mouse, 0, mouse_x, mouse_y);
