function s_new_bombardero(origen, foc_bombardero) {
	
	if o_juego.recurso[origen.grupo, m_rec_mineral] <
			o_juego.costo[foc_bombardero] {
		return false;
	}
	with origen {
		var aux = instance_create_depth(x + random_range(-5, 5),
			y + random_range(-5, 5), -y, o_bombardero);
		aux.grupo = grupo;
		switch foc_bombardero {
			case m_foc_bomb_normal:
				aux.bomba = 0;
				break;
			case m_foc_bomb_dispersion:
				aux.bomba = 1;
				break;
			case m_foc_bomb_linea:
				aux.bomba = 2;
				break;
		}
		o_juego.recurso[grupo, m_rec_mineral] -=
			o_juego.costo[foc_bombardero];
		return true;
	}
	return false;
}
