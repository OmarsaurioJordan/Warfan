function s_new_nuclear(origen) {
	
	if o_juego.recurso[origen.grupo, m_rec_mineral] <
			o_juego.costo[m_foc_bomb_nuclear] {
		return false;
	}
	var ok = false;
	with origen {
		if reloj_nuclear == 0 {
			var aux = instance_create_depth(x + random_range(-5, 5),
				y + random_range(-5, 5), -y, o_nuclear);
			aux.grupo = grupo;
			o_juego.recurso[grupo, m_rec_mineral] -=
				o_juego.costo[m_foc_bomb_nuclear];
			ok = true;
			s_demoler(id);
		}
	}
	return ok;
}
