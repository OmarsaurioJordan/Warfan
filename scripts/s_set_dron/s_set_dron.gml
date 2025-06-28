function s_set_dron(origen) {
	
	if o_juego.recurso[origen.grupo, m_rec_mineral] <
			o_juego.costo[m_foc_dron] {
		return false;
	}
	with origen {
		if mi_dron == noone {
			return false;
		}
		mi_dron.x = x;
		mi_dron.y = y;
		o_juego.recurso[grupo, m_rec_mineral] -=
			o_juego.costo[m_foc_dron];
		return true;
	}
	return false;
}
