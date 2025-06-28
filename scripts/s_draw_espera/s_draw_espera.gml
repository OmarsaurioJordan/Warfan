function s_draw_espera(pos_x, pos_y, esc, texto) {
	
	with o_juego {
		draw_sprite_ext(d_gui, 6, pos_x, pos_y,
			esc, esc, 0, c_white, 0.666);
		draw_sprite_ext(d_gui, 32, pos_x, pos_y,
			esc, esc, 0, c_white, 1);
		draw_text_transformed_color(pos_x + 85 * esc, pos_y,
			texto, esc, esc, 0, c_black, c_black, c_black, c_black, 1);
	}
}
