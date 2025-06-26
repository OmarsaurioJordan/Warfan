function s_set_mejora(origen) {
	
	if o_juego.recurso[origen.grupo, m_rec_madera] <
			o_juego.costo[m_foc_mejora] {
		return false;
	}
	with origen {
		if nivel < 2 {
			nivel++;
			o_juego.recurso[grupo, m_rec_madera] -=
				o_juego.costo[m_foc_mejora];
			return true;
		}
	}
	return false;
}
