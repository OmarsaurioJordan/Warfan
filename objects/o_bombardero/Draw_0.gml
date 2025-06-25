draw_sprite(d_entes, bomba, x, y - altura);
draw_sprite_ext(d_entes_color, bomba, x, y - altura,
	1, 1, 0, g_color[grupo], 1);
if reloj_paso == 3 {
	draw_sprite_ext(d_entes, 4, x, y - altura,
		-1, 1, 0, c_white, 1);
	draw_sprite_ext(d_entes_color, 4, x, y - altura,
		-1, 1, 0, g_color[grupo], 1);
}
else {
	draw_sprite(d_entes, 3 + reloj_paso, x, y - altura);
	draw_sprite_ext(d_entes_color, 3 + reloj_paso, x, y - altura,
		1, 1, 0, g_color[grupo], 1);
}
