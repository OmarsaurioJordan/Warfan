function s_inicializar_grupos(iteraciones, plantas_near) {
	
	var puntos = noone;
	var xx, yy, tot, f;
	var lis = ds_list_create();
	// buscar puntos al azar
	tot = 0;
	repeat iteraciones {
		// encontrar lugar lejos de los bordes, en tierra y lejos de otros puntos
		f = 100;
		do {
			f--;
			xx = random_range(m_vision_torre * 2, g_width - m_vision_torre * 2);
			yy = random_range(m_vision_torre * 2, g_height - m_vision_torre * 2);
			if is_array(puntos) {
				for (var k = 0; k < array_length(puntos); k++) {
					if s_vec_distancia(xx, yy, puntos[k, 0], puntos[k, 1]) < g_height * 0.3 {
						xx = -1;
						break;
					}
				}
			}
		}
		until ((xx != -1 and s_radio_mi_bioma(xx, yy, m_vision_torre, false)) or f < 0);
		if f < 0 {
			continue;
		}
		// averiguar los recursos cercanos
		if s_populization(xx, yy) < 0.8 {
			continue;
		}
		ds_list_clear(lis);
		if collision_circle_list(xx, yy, m_vision_extractor, o_mineral,
				true, false, lis, false) > 1 {
			continue;
		}
		ds_list_clear(lis);
		if collision_circle_list(xx, yy, m_vision_extractor * 2, o_mineral,
				true, false, lis, false) > 5 {
			continue;
		}
		ds_list_clear(lis);
		if collision_circle_list(xx, yy, m_vision_extractor, o_planta,
				true, false, lis, false) > plantas_near {
			continue;
		}
		ds_list_clear(lis);
		if collision_circle_list(xx, yy, m_vision_extractor * 2, o_planta,
				true, false, lis, false) > 30 {
			continue;
		}
		// agregar punto a la lista
		puntos[tot, 0] = xx;
		puntos[tot, 1] = yy;
		tot++;
	}
	// eliminar el intento si no hay candidatos
	ds_list_destroy(lis);
	if tot < s_num_players(true) {
		return false;
	}
	// elegir grupos al azar midiendo distancia minima entre puntos
	var mejor_grupo, un_grupo;
	un_grupo[0] = 1000000; // distancia minima
	mejor_grupo[0] = 0; // distancia maxima
	for (var i = 1; i <= s_num_players(true); i++) {
		un_grupo[i] = -1; // ind en puntotes
		mejor_grupo[i] = -1; // ind en puntotes
	}
	repeat array_length(puntos) * power(s_num_players(true), 2) {
		// limpiar la lista con un valor altisimo
		for (var i = 0; i < array_length(un_grupo); i++) {
			un_grupo[i] = 1000000;
		}
		// buscar puntos al azar no repetidos
		for (var i = 1; i <= s_num_players(true); i++) {
			while (un_grupo[i] == 1000000) {
				un_grupo[i] = irandom(tot - 1);
				for (var k = i - 1; k > 0; k--) {
					if un_grupo[i] == un_grupo[k] {
						un_grupo[i] = 1000000;
						break;
					}
				}
			}
		}
		// medir la distancia menor entre los puntos
		for (var i = 1; i <= s_num_players(true); i++) {
			for (var k = i + 1; k <= s_num_players(true); k++) {
				un_grupo[0] = min(un_grupo[0],
					s_vec_distancia(
						puntos[un_grupo[i], 0],
						puntos[un_grupo[i], 1],
						puntos[un_grupo[k], 0],
						puntos[un_grupo[k], 1]));
			}
		}
		// comparar con el mejor resultado
		if un_grupo[0] > mejor_grupo[0] {
			mejor_grupo[0] = un_grupo[0];
			for (var i = 1; i <= s_num_players(true); i++) {
				mejor_grupo[i] = un_grupo[i];
			}
		}
	}
	// crear la madera para extraer
	var lisss = ds_list_create();
	var refer = instance_create_depth(0, 0, 0, o_planta);
	var palos, xm, ym, ok;
	for (var i = 1; i <= s_num_players(true); i++) {
		ds_list_clear(lisss);
		xm = puntos[mejor_grupo[i], 0];
		ym = puntos[mejor_grupo[i], 1];
		palos = collision_circle_list(xm, ym,
			m_vision_extractor, o_planta, true, false, lisss, false);
		repeat plantas_near - palos {
			do {
				xx = xm + random_range(-m_vision_extractor / 2, m_vision_extractor / 2);
				yy = ym + random_range(-m_vision_extractor / 2, m_vision_extractor / 2);
				if s_is_agua(xx, yy) {
					continue;
				}
				with refer {
					ok = place_meeting(xx, yy, o_natural);
				}
				if ok {
					continue;
				}
			}
			until (point_distance(xm, ym, xx, yy) < m_vision_extractor);
			instance_create_depth(xx, yy, -yy, o_planta);
		}
	}
	ds_list_destroy(lisss);
	instance_destroy(refer);
	// crear las ciudades iniciales
	var la_ia;
	tot = 1;
	for (var i = 0; i < array_length(o_control.grupote); i++) {
		o_juego.recurso[i, m_rec_vivo] = 0;
		if o_control.grupote[i] != m_ctrl_vacio {
			o_juego.recurso[i, m_rec_vivo] = 1;
			if o_control.grupote[i] == m_ctrl_auto {
				la_ia = instance_create_depth(0, 0, 0, o_ia);
				la_ia.grupo = i;
			}
			s_new_ciudad(puntos[mejor_grupo[tot], 0],
				puntos[mejor_grupo[tot], 1], i, m_radio_ciudad);
			tot++;
		}
	}
	return true;
}
