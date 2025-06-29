// busqueda de puntos especiales
if random(1) < m_ia_prob_accion {
	s_busca_punto(id, random(g_width), random(g_height));
}
// modificar los puntos ya existentes
if random(1) < m_ia_prob_accion {
	if !ds_list_empty(punto_ia_tipo) {
		var p, tt;
		repeat 20 {
			p = irandom(ds_list_size(punto_ia_tipo) - 1);
			tt = ds_list_find_value(punto_ia_tipo, p);
			if tt != m_ia_punto_altamar and
					tt != m_ia_punto_nuclear and
					tt != m_ia_punto_peligro {
				break;
			}
		}
		s_acomodar_punto(id, p, 0, 0);
	}
}

// posibilidades de lanzamiento de soldados y bombas
if random(1) < m_ia_prob_accion {
	s_pre_paracaidas(id);
}
if random(1) < m_ia_prob_accion {
	s_pre_bombardeo(id);
}
if random(1) < m_ia_prob_accion {
	s_pre_construccion(id);
}

// activar modulos de toma de deciciones
if random(1) < m_ia_prob_accion {
	s_modulo_exploracion(id); // exparcir soldados por el mapa
}
if random(1) < m_ia_prob_accion {
	s_modulo_conquista(id); // alcanzar puntos de interes
}
if random(1) < m_ia_prob_accion {
	s_modulo_construccion(id); // crear edificaciones
}
if random(1) < m_ia_prob_accion {
	s_modulo_bombardeo(id); // lanzar explosivos
}

// correr temporizadores de posibilidades
var tt;
for (var i = ds_list_size(posible_retardo) - 1; i >= 0; i--) {
	tt = ds_list_find_value(posible_retardo, i) - dlt;
	if tt <= 0 {
		ds_list_delete(posible_retardo, i);
		ds_list_delete(posible_accion, i);
		ds_list_delete(posible_criterio, i);
		ds_list_delete(posible_edificio, i);
		ds_list_delete(posible_x, i);
		ds_list_delete(posible_y, i);
	}
	else {
		ds_list_replace(posible_retardo, i, tt);
	}
}
// correr temporizadores de aprobaciones
for (var i = ds_list_size(aprobado_retardo) - 1; i >= 0; i--) {
	tt = ds_list_find_value(aprobado_retardo, i) - dlt;
	if tt <= 0 {
		// ejecucion de accion
		var yo = id;
		with ds_list_find_value(aprobado_edificio, i) {
			var tot = ds_list_find_value(yo.aprobado_cantidad, i);
			var tip = ds_list_find_value(yo.aprobado_accion, i);
			repeat tot {
				switch object_index {
					case o_cuartel:
						s_new_paracaidas(id, tip);
						break;
					case o_torre:
						s_new_bombardero(id, tip);
						break;
					case o_silo_nuclear:
						s_new_nuclear(id);
						break;
					case o_antena:
						s_new_onda(id);
						break;
					case o_edificio:
						s_set_mejora(id);
						break;
					case o_fuerte:
						s_new_velero(id);
						break;
					case o_soldado:
						s_auto_construir(
							ds_list_find_value(yo.aprobado_x, i),
							ds_list_find_value(yo.aprobado_y, i),
							grupo, tip);
						break;
				}
			}
		}
		// eliminarla de la lista
		ds_list_delete(aprobado_retardo, i);
		ds_list_delete(aprobado_accion, i);
		ds_list_delete(aprobado_cantidad, i);
		ds_list_delete(aprobado_edificio, i);
		ds_list_delete(aprobado_x, i);
		ds_list_delete(aprobado_y, i);
	}
	else {
		ds_list_replace(aprobado_retardo, i, tt);
	}
}
