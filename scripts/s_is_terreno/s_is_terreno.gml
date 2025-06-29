function s_is_terreno(pos_x, pos_y) {
	// return 0 no se puede construir, 1 pueblo, 2 extraccion, 3 ciudad
	
	if pos_x > m_vision_suelo and pos_x < g_width - m_vision_suelo {
		if pos_y > m_vision_suelo and pos_y < g_height - m_vision_suelo {
			if s_radio_mi_bioma(pos_x, pos_y, m_radio_ciudad, false) {
				return 3;
			}
			if s_radio_mi_bioma(pos_x, pos_y, m_radio_ciudad * 0.666, false) {
				return 2;
			}
			if s_radio_mi_bioma(pos_x, pos_y, m_radio_ciudad * 0.333, false) {
				return 1;
			}
		}
	}
	return 0;
}
