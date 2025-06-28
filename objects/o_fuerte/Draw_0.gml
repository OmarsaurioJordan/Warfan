if g_edifi_foco == id or g_seleccion == id {
	draw_sprite(d_edificios_foco, 1, x, y);
}
draw_sprite(d_edificios, 4, x, y);
draw_sprite(d_edificios, 5, x, y);
draw_sprite_ext(d_edificios_color, 5, x, y,
	1, 1, 0, g_color[grupo], 1);
// monigotes
draw_sprite(d_edificios, 3, x, y);
draw_sprite_ext(d_edificios_color, 3, x, y,
	1, 1, 0, g_color[grupo], 1);
// fin monigotes
if paso_disparo != -1 {
	draw_sprite(d_disparo, paso_disparo, x - 15, y - 15);
}
draw_sprite(d_edificios, 2, x, y);
draw_sprite_ext(d_edificios_color, 2, x, y,
	1, 1, 0, g_color[grupo], 1);
s_draw_mifuego(id, 16);
