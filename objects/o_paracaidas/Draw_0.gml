if reloj_vuelo != 0 {
	draw_sprite(d_entes, 11 + nivel, x, y - altura);
	draw_sprite_ext(d_entes_color, 11 + nivel, x, y - altura,
		1, 1, 0, g_color[grupo], 1);
}
draw_sprite(d_entes, 10, x, y - altura);
draw_sprite_ext(d_entes_color, 10, x, y - altura,
	1, 1, 0, g_color[grupo], 1);
