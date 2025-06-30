function s_ia_recursos(la_ia, is_madera, solo_ahorro) {
	// return valor sea madera o mineral
	
	var res = 0;
	with la_ia {
		if is_madera {
			if !solo_ahorro {
				res = o_juego.recurso[grupo, m_rec_madera];
			}
			res += ahorro[m_foc_antena] +
				ahorro[m_foc_cuartel] +
				ahorro[m_foc_edificio] +
				ahorro[m_foc_fabrica] +
				ahorro[m_foc_fuerte] +
				ahorro[m_foc_silo_nuclear] +
				ahorro[m_foc_torre] +
				ahorro[m_foc_velero];
		}
		else {
			if !solo_ahorro {
				res = o_juego.recurso[grupo, m_rec_mineral];
			}
			res += ahorro[m_foc_antibombas] +
				ahorro[m_foc_bomb_nuclear] +
				ahorro[m_foc_bomb_normal]; // las 3
		}
	}
	return res;
}
