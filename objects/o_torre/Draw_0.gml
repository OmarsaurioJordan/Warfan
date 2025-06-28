if g_edifi_foco == id or g_seleccion == id {
	draw_sprite(d_edificios_foco, 2, x, y);
}
draw_sprite(d_edificios, 7, x, y);
draw_sprite_ext(d_edificios_color, 7, x, y,
	1, 1, 0, g_color[grupo], 1);
s_draw_mifuego(id, 40);
