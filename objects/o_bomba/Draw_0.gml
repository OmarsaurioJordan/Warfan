if bomba == m_bomb_normal {
	draw_sprite(d_entes, 0, x, y - altura);
	draw_sprite_ext(d_entes_color, 0, x, y - altura,
		1, 1, 0, g_color[grupo], 1);
}
else {
	draw_sprite(d_entes, 5 + bomba, x, y - altura);
	draw_sprite_ext(d_entes_color, 5 + bomba, x, y - altura,
		1, 1, 0, g_color[grupo], 1);
}
