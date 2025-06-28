function s_new_onda(origen) {
	
	if o_juego.recurso[origen.grupo, m_rec_mineral] <
			o_juego.costo[m_foc_antibombas] {
		return false;
	}
	with origen {
		if reloj_recarga == 0 {
			var aux;
			var codigo_onda = random(1);
			var desf = random(360);
			var paso = 360 / m_ondas_total;
			for (var i = 0; i < m_ondas_total; i++) {
				aux = instance_create_depth(x, y, -y, o_onda);
				aux.grupo = grupo;
				aux.direction = i * paso + desf;
				aux.codigo_onda = codigo_onda;
			}
			reloj_recarga = m_cadencia_ondas;
			return true;
		}
	}
	return false;
}
