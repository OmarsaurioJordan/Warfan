function s_draw_foc_boton(mou_x, mou_y, pos_x, pos_y, esc, texto,
		foc_base, ind, subimg, is_cuadro, is_selected) {
	// foc_base es el m_foc_ minimo para comenzar a contar con ind
	// ind seria el iterador actual, puede ser 0 para dibujar fuera de un for
	// subimg del d_gui que se quiere usar como boton
	// is_cuadro bool para ver si fondo cuadrado o redondo
	// is_selected para saber si se subrrayata el fondo
	
	with o_juego {
		if is_cuadro {
			draw_sprite_ext(d_gui, 5, pos_x, pos_y,
				esc, esc, 0, c_white, 0.666);
			if is_selected {
				draw_sprite_ext(d_gui, 31, pos_x, pos_y,
					esc, esc, 0, c_lime, 0.333);
			}
		}
		else {
			draw_sprite_ext(d_gui, 4, pos_x, pos_y,
				esc, esc, 0, c_white, 0.666);
			if is_selected {
				// falta d_gui
			}
		}
		if point_distance(mou_x, mou_y, pos_x, pos_y) < 32 * esc {
			mouse_foco = foc_base + ind;
			draw_sprite_ext(d_gui, subimg + ind, pos_x, pos_y,
				1.3 * esc, 1.3 * esc, 0, c_white, 1);
			draw_sprite_ext(d_gui_color, subimg + ind, pos_x, pos_y,
				1.3 * esc, 1.3 * esc, 0, g_color[g_migrupo], 1);
		}
		else {
			draw_sprite_ext(d_gui, subimg + ind, pos_x, pos_y,
				esc, esc, 0, c_white, 1);
			draw_sprite_ext(d_gui_color, subimg + ind, pos_x, pos_y,
				esc, esc, 0, g_color[g_migrupo], 1);
		}
		draw_text_transformed_color(pos_x, pos_y + 50 * esc,
			texto, esc, esc, 0, c_black, c_black, c_black, c_black, 1);
	}
}
