function s_modulo_construccion(la_ia) {
	
	with la_ia {
		// que tipo de edificio desea hacer
		var cual = choose(m_foc_cuartel,
			m_foc_edificio, m_foc_fabrica,
			m_foc_fuerte, m_foc_torre); // Tarea faltan edificaciones
		var tot = 0;
		with o_fabrica {
			if grupo == la_ia.grupo {
				tot++;
			}
		}
		if tot < 3 {
			cual = m_foc_fabrica;
			// volcar todo el dinero a la fabrica
			for (var i = 0; i < array_length(admin); i++) {
				if admin[i][0] != m_foc_fabrica {
					if s_is_foc_madera(admin[i][0]) {
						ahorro[m_foc_fabrica] += ahorro[admin[i][0]];
						ahorro[admin[i][0]] = 0;
					}
				}
			}
		}
		// averiguar si hay la cantidad suficiente de candidatos
		tot = 0;
		for (var i = 0; i < ds_list_size(posible_accion); i++) {
			if ds_list_find_value(posible_accion, i) == cual {
				tot++;
			}
		}
		if tot < m_ia_cluster_construir {
			break;
		}
		// elegir al candidato mejor
		var mejor = -1;
		var mejor_valor = -1;
		var mv;
		for (var i = 0; i < ds_list_size(posible_accion); i++) {
			if ds_list_find_value(posible_accion, i) == cual {
				if instance_exists(ds_list_find_value(posible_edificio, i)) {
					mv = ds_list_find_value(posible_criterio, i);
					if mv > mejor_valor {
						mejor_valor = mv;
						mejor = i;
					}
				}
			}
		}
		if mejor != -1 {
			s_posible_aprobado(id, mejor, 1, true);
		}
		// eliminar todos los candidatos
		for (var i = ds_list_size(posible_accion) - 1; i >= 0; i--) {
			if ds_list_find_value(posible_accion, i) == cual {
				ds_list_delete(posible_retardo, i);
				ds_list_delete(posible_accion, i);
				ds_list_delete(posible_criterio, i);
				ds_list_delete(posible_edificio, i);
				ds_list_delete(posible_x, i);
				ds_list_delete(posible_y, i);
			}
		}
	}
}
