function s_acomodar_punto(la_ia, pos, zona_x, zona_y) {
	// zonas en 0,0 para no tenerlas en cuenta
	
	with la_ia {
		var tipo = ds_list_find_value(punto_ia_tipo, pos);
		switch tipo {
			case m_ia_punto_altamar:
			case m_ia_punto_nuclear:
			case m_ia_punto_peligro:
				return false;
		}
		var xx = ds_list_find_value(punto_ia_x, pos);
		var yy = ds_list_find_value(punto_ia_y, pos);
		// solo si coincide con zonas
		if zona_x != 0 and zona_y != 0 {
			if s_vec_distancia(xx, yy, zona_x, zona_y) <
					max(m_vision_extractor, m_vision_torre) * 1.5 {
				s_delete_punto(id, pos);
				s_busca_punto(id, xx, yy);
			}
			break;
		}
		s_delete_punto(id, pos);
		// intentar ver si en otra posicion mejora
		var res = s_busca_punto(id,
			xx + random_range(-m_vision_suelo, m_vision_suelo),
			yy + random_range(-m_vision_suelo, m_vision_suelo));
		if res == -1 {
			s_busca_punto(id, xx, yy);
		}
		else {
			var ant = ds_list_find_index(o_control.peso_puntos, tipo);
			var neo = ds_list_find_index(o_control.peso_puntos, res);
			if neo > ant {
				s_delete_punto(id, ds_list_size(punto_ia_x) - 1);
				s_busca_punto(id, xx, yy);
			}
		}
	}
}
