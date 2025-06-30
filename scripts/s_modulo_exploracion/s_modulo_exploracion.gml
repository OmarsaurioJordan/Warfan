function s_modulo_exploracion(la_ia) {
	
	with la_ia {
		// disminuir frecuencia lanzamiento si se han lanzado ya todos
		if s_costo_acciones(id, m_foc_paracaidas1,
				m_foc_paracaidas2, m_foc_paracaidas3) >=
				o_juego.recurso[grupo, m_rec_gente] {
			break;
		}
		// hallar el punto con mayor distancia
		var max_dist = 0;
		var max_ind = -1;
		var dd, tip;
		for (var i = 0; i < ds_list_size(posible_retardo); i++) {
			tip = ds_list_find_value(posible_accion, i);
			switch tip {
				case m_foc_paracaidas1:
				case m_foc_paracaidas2:
				case m_foc_paracaidas3:
					// criterio precalculado
					dd = ds_list_find_value(posible_criterio, i);
					if dd > max_dist {
						max_dist = dd;
						max_ind = i;
					}
					break;
			}
		}
		if max_ind != -1 and max_dist > m_vision_suelo * 2 {
			// buscar si ya se ha lanzado alguien recientemente
			var edi = ds_list_find_value(posible_edificio, max_ind);
			var r1, r2;
			for (var i = 0; i < ds_list_size(aprobado_x); i++) {
				tip = ds_list_find_value(aprobado_accion, i);
				switch tip {
					case m_foc_paracaidas1:
					case m_foc_paracaidas2:
					case m_foc_paracaidas3:
						if edi == ds_list_find_value(aprobado_edificio, i) {
							r1 = ds_list_find_value(posible_retardo, max_ind);
							r2 = ds_list_find_value(aprobado_retardo, i);
							if abs(r1 - r2) < m_ia_retardo_rafaga_cosas {
								return false;
							}
						}
						break;
				}
			}
			s_posible_aprobado(id, max_ind, 1, false);
		}
	}
}
