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
		for (var i = 0; i < 360; i += 30) {
			aux = instance_create_depth(x, y, -y, o_bomba);
			aux.grupo = grupo;
			aux.altura = altura;
			aux.bomba = bomba;
			aux.dir_impulso = i + desf + random_range(-10, 10);
		}
	}
	else {
		aux = instance_create_depth(x, y, -y, o_bomba);
		aux.grupo = grupo;
		aux.altura = altura;
		aux.bomba = bomba;
	}
	instance_destroy();
}
else if bomba == m_bomb_linea and reloj_vuelo < reloj_linea {
	var aux = instance_create_depth(x, y, -y, o_bomba);
	aux.grupo = grupo;
	aux.altura = altura;
	aux.bomba = bomba;
	// ubicar cuando caera la proxima
	var paso = m_bombardero_reloj_vuelo *
		(1 - m_bomba_linea_por_ini) / 11;
	for (var i = 0; i <= paso * 11; i += paso) {
		if reloj_vuelo < i {
			reloj_linea = i - paso;
			break;
		}
	}
}
