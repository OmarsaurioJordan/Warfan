draw_sprite(d_entes, 17 + paso_anima, x, y);
draw_sprite_ext(d_entes_color, 17 + paso_anima, x, y,
	1, 1, 0, g_color[grupo], 1);
s_draw_mifuego(id, 14);
if paso_disparo != -1 {
	draw_sprite(d_disparo, paso_disparo, x, y);
}
