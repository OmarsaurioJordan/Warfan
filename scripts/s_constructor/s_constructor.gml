function s_constructor(quien, iteraciones, foc_edificio) {
	
	var xx = -1;
	var yy = -1;
	var valorsote = 0;
	var xxx, yyy, aux, valor, otro;
	with quien {
		repeat iteraciones {
			xxx = x + random_range(-m_vision_suelo, m_vision_suelo);
			yyy = y + random_range(-m_vision_suelo, m_vision_suelo);
			aux = s_ok_construir(xxx, yyy, grupo, foc_edificio);
			if aux != noone {
				switch foc_edificio {
					case m_foc_fabrica:
						valor = s_count_circle(xxx, yyy,
							m_vision_extractor, o_planta, noone) +
							s_count_circle(xxx, yyy,
							m_vision_extractor, o_mineral, noone);
						break;
					case m_foc_antena:
					case m_foc_fuerte:
						valor = s_count_circle_grupo(xxx, yyy,
							m_vision_torre, o_bloque, noone, grupo);
						break;
					case m_foc_cuartel:
						otro = s_meet_unit(xxx, yyy, 1000000,
							o_cuartel, noone, grupo);
						if otro == noone {
							valor = irandom_range(g_height / 2, g_height);
							break;
						}
						valor = s_vec_distancia(xxx, yyy, otro.x, otro.y);
						break;
					case m_foc_edificio:
						valor = s_count_circle_grupo(xxx, yyy,
							m_vision_torre, o_edificio, noone, grupo);
						break;
					case m_foc_torre:
						otro = s_meet_unit(xxx, yyy, 1000000,
							o_torre, noone, grupo);
						if otro == noone {
							valor = irandom_range(g_height / 2, g_height);
							break;
						}
						valor = s_vec_distancia(xxx, yyy, otro.x, otro.y);
						break;
				}
				if valor > valorsote {
					valorsote = valor;
					xx = xxx;
					yy = yyy;
				}
			}
		}
	}
	return [xx, yy, valorsote];
}
