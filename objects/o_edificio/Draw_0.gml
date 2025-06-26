switch nivel {
	case 0:
		draw_sprite(d_edificios, 28, x, y);
		draw_sprite(d_edificios, 29, x -12 +
			reloj_anima[0] * 24, y);
		draw_sprite(d_edificios, 27, x, y);
		draw_sprite_ext(d_edificios_color, 27, x, y,
			1, 1, 0, g_color[grupo], 1);
		break;
	case 1:
		draw_sprite(d_edificios, 24, x, y);
		draw_sprite(d_edificios, 25, x -12 +
			reloj_anima[1] * 24, y);
		draw_sprite(d_edificios, 26, x -12 +
			reloj_anima[0] * 24, y);
		draw_sprite(d_edificios, 23, x, y);
		draw_sprite_ext(d_edificios_color, 23, x, y,
			1, 1, 0, g_color[grupo], 1);
		break;
	case 2:
		draw_sprite(d_edificios, 19, x, y);
		draw_sprite(d_edificios, 20, x -12 +
			reloj_anima[2] * 24, y);
		draw_sprite(d_edificios, 21, x -12 +
			reloj_anima[1] * 24, y);
		draw_sprite(d_edificios, 22, x -12 +
			reloj_anima[0] * 24, y);
		draw_sprite(d_edificios, 18, x, y);
		draw_sprite_ext(d_edificios_color, 18, x, y,
			1, 1, 0, g_color[grupo], 1);
		break;
}
