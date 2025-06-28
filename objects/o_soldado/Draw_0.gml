draw_sprite(d_entes, 10, x, y);
draw_sprite_ext(d_entes_color, 10, x, y,
	1, 1, 0, g_color[grupo], 1);
if vida < vida_max / 2 {
	draw_sprite(d_entes, 28, x, y);
}
if paso_disparo != -1 {
	draw_sprite(d_disparo, paso_disparo, x, y);
}
