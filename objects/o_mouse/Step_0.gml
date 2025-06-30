if o_juego.construir != noone {
	x = mouse_x;
	y = mouse_y;
	depth = -y;
	// ver si se puede construir
	var obrero = noone;
	if o_juego.recurso[g_migrupo, m_rec_vivo] == 1 {
		obrero = s_ok_construir(x, y, g_migrupo, o_juego.constru_foc, true);
	}
	okey_construir = obrero != noone;
	// construir el edificio
	if mouse_check_button_pressed(mb_left) and okey_construir {
		s_construir(x, y, g_migrupo, o_juego.constru_foc, obrero);
		with o_juego {
			if tutorial == 2 {
				tutorial++;
			}
		}
	}
}
