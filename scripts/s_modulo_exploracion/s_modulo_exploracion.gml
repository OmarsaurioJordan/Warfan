function s_modulo_exploracion(la_ia) {
	
	with la_ia {
		// disminuir frecuencia lanzamiento si se han lanzado ya todos
		var cst = s_costo_acciones(id);
		if cst[2] >= o_juego.recurso[grupo, m_rec_gente] {
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
					// criterio de ya lanzados
					// Tarea, para que no se lancen en linea seguido, usar x,y aprobados
					break;
			}
		}
		if max_ind != -1 and max_dist > m_vision_suelo * 2 {
			s_posible_aprobado(id, max_ind, 1, false);
		}
	}
}
