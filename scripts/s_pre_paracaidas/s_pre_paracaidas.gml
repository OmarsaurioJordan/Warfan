function s_pre_paracaidas(la_ia) {
	
	with la_ia {
		var lanza = s_objeto_azar(grupo, o_cuartel);
		if lanza != noone {
			var retardo = random_range(0.5, m_viento_historial - 1) * m_viento_reloj_max;
			var tip = choose(m_foc_paracaidas1, m_foc_paracaidas2, m_foc_paracaidas2,
				m_foc_paracaidas3, m_foc_paracaidas3, m_foc_paracaidas3);
			var res = s_prediccion(lanza.x, lanza.y, retardo, tip);
			if point_distance(lanza.x, lanza.y, res[0], res[1]) > 32 {
				if !s_is_agua(res[0], res[1]) {
					s_add_posible(id, retardo, tip,
						s_min_soldado_pos(res[0], res[1], grupo),
						lanza, res[0], res[1]);
				}
			}
		}
	}
}
