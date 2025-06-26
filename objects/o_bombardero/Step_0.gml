// animacion
s_anima_aire(id);
reloj_anima -= dlts;
if reloj_anima <= 0 {
	reloj_anima += random_range(0.1, 0.15);
	reloj_paso++;
	if reloj_paso > 3 {
		reloj_paso = 0;
	}
}

// moverse con el viento
if !s_colision_aire(id, 0.2) {
	x += g_viento_x * m_vel_bombardero * dlt;
	y += g_viento_y * m_vel_bombardero * dlt;
}
s_limites(id);

// destruirse automaticamente
reloj_vuelo -= dlt;
if reloj_vuelo <= 0 {
	var aux;
	if bomba == m_bomb_dispersion {
		var desf = random(360);
		var paso = 360 / m_bomba_dispersion_total;
		for (var i = 0; i < m_bomba_dispersion_total; i++) {
			aux = instance_create_depth(x, y, -y, o_bomba);
			aux.grupo = grupo;
			aux.altura = altura;
			aux.bomba = bomba;
			aux.dir_impulso = i * paso +
				desf + random_range(-paso / 3, paso / 3);
		}
	}
	else if bomba != m_bomb_linea or
			point_distance(x, y, linea_x, linea_y) > 24 {
		aux = instance_create_depth(x, y, -y, o_bomba);
		aux.grupo = grupo;
		aux.altura = altura;
		aux.bomba = bomba;
	}
	instance_destroy();
}
else if bomba == m_bomb_linea and reloj_vuelo < reloj_linea {
	// lanzar bomba
	if point_distance(x, y, linea_x, linea_y) > 24 {
		var aux = instance_create_depth(x, y, -y, o_bomba);
		aux.grupo = grupo;
		aux.altura = altura;
		aux.bomba = bomba;
		linea_x = x;
		linea_y = y;
	}
	// ubicar cuando caera la proxima
	var paso = m_bombardero_reloj_vuelo *
		(1 - m_bomba_linea_por_ini) / (m_bomba_linea_total - 1);
	for (var i = 0; i <= paso * (m_bomba_linea_total - 1); i += paso) {
		if reloj_vuelo < i {
			reloj_linea = i - paso;
			break;
		}
	}
}
