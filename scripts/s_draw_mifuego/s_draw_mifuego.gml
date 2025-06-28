function s_draw_mifuego(quien, altu_fuego) {
	
	with quien {
		var v = vida / vida_max;
		if v < 0.9 {
			v = lerp(1.5, 0.5, v);
			draw_sprite_ext(d_fuego, g_paso_fuego[fuego],
				x, y - altu_fuego, v, v, 0, c_white, 0.75);
		}
	}
}
