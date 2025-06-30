function s_set_mejora(origen) {
	
	if o_juego.recurso[origen.grupo, m_rec_madera] <
			o_juego.costo[m_foc_mejora] {
		return false;
	}
	with origen {
		if nivel < 2 {
			nivel++;
			vida_max = s_get_vida(object_index) * lerp(0.5, 1, nivel / 2);
			vida = vida_max;
			o_juego.recurso[grupo, m_rec_madera] -=
				o_juego.costo[m_foc_mejora];
			s_viviendas();
			s_audio(a_construir, x, y); // Tarea otro sonido
			return true;
		}
	}
	return false;
}
