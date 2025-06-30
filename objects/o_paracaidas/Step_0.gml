if reloj_vuelo == 0 {
	// caer para aterrizar
	altura = max(0, altura - m_gravedad * dlt);
	if altura == 0 {
		if s_is_agua(x, y) {
			var aux = instance_create_depth(x, y, -y, o_muerto);
			aux.grupo = grupo;
			aux.subimg = 14;
			aux.reloj_fin = 3;
		}
		else {
			var aux = instance_create_depth(x, y, -y, o_soldado);
			aux.grupo = grupo;
			o_juego.recurso[grupo, m_rec_soldados]++;
			if viejito {
				s_envejecer(aux);
			}
		}
		instance_destroy();
	}
}
else {
	// moverse con el viento
	s_anima_aire(id);
	reloj_vuelo = max(0, reloj_vuelo - dlt);
	if !s_colision_aire(id, 0.2) {
		var plus = lerp(m_vel_paracaidas_min,
			m_vel_paracaidas_max, nivel / 2);
		x += g_viento_x * plus * dlt;
		y += g_viento_y * plus * dlt;
	}
}
s_limites(id);
