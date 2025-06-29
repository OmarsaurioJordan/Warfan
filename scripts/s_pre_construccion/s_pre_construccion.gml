function s_pre_construccion(la_ia) {
	
	with la_ia {
		var aux = s_objeto_azar(grupo, o_soldado);
		if aux == noone {
			break;
		}
		var pnt = s_nearest_punto(id, aux.x, aux.y);
		if pnt == -1 {
			break;
		}
		var xx = ds_list_find_value(punto_ia_x, pnt);
		var yy = ds_list_find_value(punto_ia_y, pnt);
		if s_vec_distancia(aux.x, aux.y, xx, yy) < m_vision_torre {
			var tip = ds_list_find_value(punto_ia_tipo, pnt);
			switch tip {
				case m_ia_punto_madera: // requiere extractor
				case m_ia_punto_mineral:
				case m_ia_punto_recursos:
				case m_ia_punto_pendiente:
				case m_ia_punto_conflicto:
				case m_ia_punto_paraiso:
					s_ciudad_mejora(id, xx, yy, m_foc_fabrica,
						o_fabrica, 1, aux);
					break;
				case m_ia_punto_metropolis: // construir a lo full
				case m_ia_punto_ciudad:
				case m_ia_punto_tenso:
				case m_ia_punto_terreno:
				case m_ia_punto_pueblo:
				case m_ia_punto_extraccion:
					switch choose(m_foc_torre, m_foc_torre,
							m_foc_edificio, m_foc_edificio,
							m_foc_fuerte, m_foc_antena,
							m_foc_cuartel, m_foc_cuartel, m_foc_cuartel) {
						// elegir al azar
						case o_cuartel:
							s_ciudad_mejora(id, xx, yy,
								m_foc_cuartel, o_cuartel, 1, aux);
							break;
						case m_foc_torre:
							s_ciudad_mejora(id, xx, yy,
								m_foc_torre, o_torre, 1, aux);
							break;
						case m_foc_edificio:
							s_ciudad_mejora(id, xx, yy,
								m_foc_edificio, o_edificio, 5, aux);
							break;
						case m_foc_fuerte:
							s_ciudad_mejora(id, xx, yy,
								m_foc_fuerte, o_fuerte, 3, aux);
							break;
						case m_foc_antena:
							s_ciudad_mejora(id, xx, yy,
								m_foc_antena, o_antena, 1, aux);
							break;
					}
					break;
			}
		}
	}
}
