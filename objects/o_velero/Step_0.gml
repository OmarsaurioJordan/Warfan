// animacion
reloj_anima -= dlt;
if reloj_anima <= 0 {
	reloj_anima = random_range(0.5, 1);
	if paso_anima == 0 {
		paso_anima = 1;
	}
	else {
		paso_anima = 0;
	}
}

// movimiento con viento
if !s_colision_agua(id, 0.2) {
	x += g_viento_x * m_vel_velero * dlt;
	y += g_viento_y * m_vel_velero * dlt;
}
s_limites(id);
if s_radio_mi_bioma(x, y, 28, true) {
	mi_agua_x = x;
	mi_agua_y = y;
}
else {
	x = mi_agua_x + random_range(-3, 3);
	y = mi_agua_y + random_range(-3, 3);
	s_limites(id);
	if s_radio_mi_bioma(x, y, 28, true) {
		mi_agua_x = x;
		mi_agua_y = y;
	}
	else {
		x = mi_agua_x;
		y = mi_agua_y;
	}
}
