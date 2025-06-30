// verificar IA
if o_juego.recurso[grupo, m_rec_vivo] == 0 {
	exit;
}

// hacer ahorro, distribuir dinero entre cosas a futuro
if random(1) < m_ia_prob_accion {
	var val;
	if o_juego.recurso[grupo, m_rec_madera] >= 3 {
		val = o_juego.recurso[grupo, m_rec_madera];
		for (var i = 0; i < array_length(admin); i++) {
			if s_is_foc_madera(admin[i][0]) {
				ahorro[admin[i][0]] += admin[i][1] * val;
			}
		}
		o_juego.recurso[grupo, m_rec_madera] = 0;
	}
	if o_juego.recurso[grupo, m_rec_mineral] >= 3 {
		val = o_juego.recurso[grupo, m_rec_mineral];
		for (var i = 0; i < array_length(admin); i++) {
			if !s_is_foc_madera(admin[i][0]) {
				ahorro[admin[i][0]] += admin[i][1] * val;
			}
		}
		o_juego.recurso[grupo, m_rec_mineral] = 0;
	}
	// re invertir dinero sobre acumulado
	var cst, is_madera;
	for (var i = 0; i < array_length(admin); i++) {
		cst = o_juego.costo[admin[i][0]];
		if ahorro[admin[i][0]] >= cst * 2 + 10 {
			val = 10;
			is_madera = s_is_foc_madera(admin[i][0]);
			for (var k = 0; k < array_length(admin); k++) {
				if is_madera {
					if s_is_foc_madera(admin[k][0]) {
						ahorro[admin[k][0]] += admin[k][1] * val;
					}
				}
				else {
					if !s_is_foc_madera(admin[k][0]) {
						ahorro[admin[k][0]] += admin[k][1] * val;
					}
				}
			}
			ahorro[admin[i][0]] -= 10;
		}
	}
}

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

// mejorar los edificios
if random(1) < m_ia_prob_accion {
	if ahorro[m_foc_mejora] >= o_juego.costo[m_foc_mejora] {
		if instance_exists(o_edificio) {
			var edi = instance_find(o_edificio, irandom(instance_number(o_edificio) - 1));
			if edi.grupo == grupo and edi.nivel < 2 {
				var ant = o_juego.recurso[grupo, m_rec_madera];
				o_juego.recurso[grupo, m_rec_madera] = ahorro[m_foc_mejora];
				s_set_mejora(edi);
				ahorro[m_foc_mejora] = o_juego.recurso[grupo, m_rec_madera];
				o_juego.recurso[grupo, m_rec_madera] = ant;
			}
		}
	}
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
			var ant;
			repeat tot {
				switch object_index {
					case o_cuartel:
						s_new_paracaidas(id, tip);
						break;
					case o_torre:
						ant = o_juego.recurso[grupo, m_rec_mineral];
						o_juego.recurso[grupo, m_rec_mineral] = yo.ahorro[m_foc_bomb_normal];
						s_new_bombardero(id, tip);
						yo.ahorro[m_foc_bomb_normal] = o_juego.recurso[grupo, m_rec_mineral];
						o_juego.recurso[grupo, m_rec_mineral] = ant;
						break;
					case o_silo_nuclear:
						ant = o_juego.recurso[grupo, m_rec_mineral];
						o_juego.recurso[grupo, m_rec_mineral] = yo.ahorro[m_foc_bomb_nuclear];
						s_new_nuclear(id);
						yo.ahorro[m_foc_bomb_nuclear] = o_juego.recurso[grupo, m_rec_mineral];
						o_juego.recurso[grupo, m_rec_mineral] = ant;
						break;
					case o_antena:
						ant = o_juego.recurso[grupo, m_rec_mineral];
						o_juego.recurso[grupo, m_rec_mineral] = yo.ahorro[m_foc_antibombas];
						s_new_onda(id);
						yo.ahorro[m_foc_antibombas] = o_juego.recurso[grupo, m_rec_mineral];
						o_juego.recurso[grupo, m_rec_mineral] = ant;
						break;
					case o_edificio:
						ant = o_juego.recurso[grupo, m_rec_madera];
						o_juego.recurso[grupo, m_rec_madera] = yo.ahorro[m_foc_mejora];
						s_set_mejora(id);
						yo.ahorro[m_foc_mejora] = o_juego.recurso[grupo, m_rec_madera];
						o_juego.recurso[grupo, m_rec_madera] = ant;
						break;
					case o_fuerte:
						ant = o_juego.recurso[grupo, m_rec_madera];
						o_juego.recurso[grupo, m_rec_madera] = yo.ahorro[m_foc_velero];
						s_new_velero(id);
						yo.ahorro[m_foc_velero] = o_juego.recurso[grupo, m_rec_madera];
						o_juego.recurso[grupo, m_rec_madera] = ant;
						break;
					case o_soldado:
						ant = o_juego.recurso[grupo, m_rec_madera];
						o_juego.recurso[grupo, m_rec_madera] = yo.ahorro[tip];
						s_auto_construir(
							ds_list_find_value(yo.aprobado_x, i),
							ds_list_find_value(yo.aprobado_y, i),
							grupo, tip);
						yo.ahorro[tip] = o_juego.recurso[grupo, m_rec_madera];
						o_juego.recurso[grupo, m_rec_madera] = ant;
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
