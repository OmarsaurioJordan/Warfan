// animacion
s_anima_aire(id);

if reloj_inicial != 0 {
	reloj_inicial = max(0, reloj_inicial - dlt);
}
else {
	// moverse con el viento
	if !s_colision_aire(id, 0.2) {
		x += g_viento_x * m_vel_bombardero * dlt;
		y += g_viento_y * m_vel_bombardero * dlt;
	}
	s_limites(id);

	// destruirse automaticamente
	reloj_vuelo -= dlt;
	if reloj_vuelo <= 0 {
		var aux = instance_create_depth(x, y, -y, o_bomba);
		aux.grupo = grupo;
		aux.altura = altura;
		aux.bomba = m_bomb_nuclear;
		instance_destroy();
	}
}
