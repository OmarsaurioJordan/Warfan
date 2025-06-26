if g_edifi_foco == id or g_seleccion == id {
	draw_sprite(d_edificios_foco, 3, x, y);
}
draw_sprite(d_edificios, 9, x, y);
draw_sprite_ext(d_edificios_color, 9, x, y,
	1, 1, 0, g_color[grupo], 1);
draw_sprite_ext(d_edificios, 10, x, y - 70,
	1, 1, helice_ang, c_white, 1);
draw_sprite_ext(d_edificios_color, 10, x, y - 70,
	1, 1, helice_ang, g_color[grupo], 1);
draw_sprite_ext(d_edificios, 10, x, y - 70,
	1, 1, helice_ang + 120, c_white, 1);
draw_sprite_ext(d_edificios_color, 10, x, y - 70,
	1, 1, helice_ang + 120, g_color[grupo], 1);
draw_sprite_ext(d_edificios, 10, x, y - 70,
	1, 1, helice_ang + 240, c_white, 1);
draw_sprite_ext(d_edificios_color, 10, x, y - 70,
	1, 1, helice_ang + 240, g_color[grupo], 1);
