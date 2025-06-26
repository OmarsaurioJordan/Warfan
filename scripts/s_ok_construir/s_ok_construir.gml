function s_ok_construir(pos_x, pos_y, el_grupo, foc_edificio) {
	// retorna el id de obrero valido o noone
	
	var obrero = noone;
	if o_juego.costo[foc_edificio] <=
			o_juego.recurso[el_grupo, m_rec_madera] {
		if point_in_rectangle(pos_x, pos_y, 36, 36, g_width - 36, g_height - 36) {
			if !place_meeting(pos_x, pos_y, o_bloque) {
				if s_radio_mi_bioma(pos_x, pos_y, 36, false) {
					obrero = s_meet_circle_grupo(pos_x, pos_y, m_vision_suelo,
						o_soldado, noone, el_grupo);
				}
			}
		}
	}
	return obrero;
}
