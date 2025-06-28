if g_edifi_foco == id or g_seleccion == id {
	draw_sprite(d_edificios_foco, 4, x, y);
}
draw_sprite(d_edificios, 13, x, y);
draw_sprite_ext(d_edificios_color, 13, x, y,
	1, 1, 0, g_color[grupo], 1);
draw_sprite(d_edificios, 12, x, y);
draw_sprite_ext(d_edificios_color, 12, x, y,
	1, 1, 0, g_color[grupo], 1);
draw_sprite(d_edificios, 14, x, y);
draw_sprite_ext(d_edificios_color, 14, x, y,
	1, 1, 0, g_color[grupo], 1);
s_draw_mifuego(id, 38);
