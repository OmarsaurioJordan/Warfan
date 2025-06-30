function s_modulo_bombardeo(la_ia) {
	
	with la_ia {
		// disminuir frecuencia lanzamiento si se han lanzado ya todos
		if s_costo_acciones(id, m_foc_bomb_normal,
				m_foc_bomb_dispersion, m_foc_bomb_linea) >=
				s_ia_recursos(id, false, true) {
			break;
		}
		// hallar el punto con mayor distancia
		var max_dist = 0;
		var max_ind = -1;
		var dd, tip;
		for (var i = 0; i < ds_list_size(posible_retardo); i++) {
			tip = ds_list_find_value(posible_accion, i);
			switch tip {
				case m_foc_bomb_normal:
				case m_foc_bomb_dispersion:
				case m_foc_bomb_linea:
					// criterio precalculado
					dd = ds_list_find_value(posible_criterio, i);
					if dd > max_dist {
						max_dist = dd;
						max_ind = i;
					}
					break;
			}
		}
		if max_ind != -1 {
			// buscar si ya se ha lanzado alguien recientemente
			var edi = ds_list_find_value(posible_edificio, max_ind);
			var r1, r2;
			for (var i = 0; i < ds_list_size(aprobado_x); i++) {
				tip = ds_list_find_value(aprobado_accion, i);
				switch tip {
					case m_foc_bomb_normal:
					case m_foc_bomb_linea:
					case m_foc_bomb_dispersion:
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
