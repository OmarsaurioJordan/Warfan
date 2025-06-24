draw_sprite(d_edificios, 9, x, y);
draw_sprite_ext(d_edificios_color, 9, x, y,
	1, 1, 0, g_color[grupo], 1);
draw_sprite_ext(d_edificios, 10, x, y - 75,
	1, 1, helice_ang, c_white, 1);
draw_sprite_ext(d_edificios_color, 10, x, y - 75,
	1, 1, helice_ang, g_color[grupo], 1);
