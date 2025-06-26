function s_new_paracaidas(origen, foc_paracaidas) {
	
	if o_juego.recurso[origen.grupo, m_rec_gente] <
			o_juego.costo[foc_paracaidas] {
		return false;
	}
	with origen {
		var aux = instance_create_depth(x + random_range(-5, 5),
			y + random_range(-5, 5), -y, o_paracaidas);
		aux.grupo = grupo;
		switch foc_paracaidas {
			case m_foc_paracaidas1:
				aux.nivel = 0;
				break;
			case m_foc_paracaidas2:
				aux.nivel = 1;
				break;
			case m_foc_paracaidas3:
				aux.nivel = 2;
				break;
		}
		o_juego.recurso[grupo, m_rec_gente] -=
			o_juego.costo[foc_paracaidas];
		return true;
	}
	return false;
}
