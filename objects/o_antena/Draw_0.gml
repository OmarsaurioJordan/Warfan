if g_edifi_foco == id or g_seleccion == id {
	draw_sprite(d_edificios_foco, 5, x, y);
}
draw_sprite(d_edificios, 16, x, y);
draw_sprite_ext(d_edificios_color, 16, x, y,
	1, 1, 0, g_color[grupo], 1);
